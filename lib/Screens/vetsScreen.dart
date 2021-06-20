import 'package:animal_app/Models/ngoItem.dart';
import 'package:animal_app/Models/vetItem.dart';
import 'package:animal_app/Providers/vetItems.dart';
import 'package:animal_app/Screens/filterVetsScreen.dart';
import 'package:animal_app/Widgets/vetItemsGrid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VetsScreen extends StatefulWidget {
  static const routeName = "/vets-screen";

  @override
  _VetsScreenState createState() => _VetsScreenState();
}

class _VetsScreenState extends State<VetsScreen> {
  var _showOnlyFavouriteItems = false;
  var _animalSettings = AnimalSettings.All;
  var _sortByProximity = false;
  var _isInit = true;
  var _isLoading = true;

  VetItems vetItemsData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      vetItemsData = Provider.of<VetItems>(context, listen: false);
      vetItemsData.itemsBuilder().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<VetItem> vetItems =
        _showOnlyFavouriteItems ? vetItemsData.favourite : vetItemsData.items;
    if (_animalSettings == AnimalSettings.All) {
      print("all");
    } else {
      vetItems = vetItems.where((vetItem) {
        return vetItem.animalSettings.contains(AnimalSettings.All) ||
            vetItem.animalSettings.contains(_animalSettings);
      }).toList();
    }

    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);

    return Scaffold(
      appBar: AppBar(
        title: Text("Veterinarians in Delhi NCR"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => FilterVetsScreen(
                              _showOnlyFavouriteItems, _animalSettings)))
                      .then((value) {
                    print(value);
                    setState(() {
                      _showOnlyFavouriteItems = value[0];
                      _animalSettings = value[1];
                    });
                  }))
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    Container(
                      height: _height * 0.05,
                      child: Text(
                        "Reputed Vets in the Delhi NCR Region",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Container(
                      child: Divider(
                        indent: 6,
                        endIndent: 6,
                        height: _height * 0.015,
                        thickness: 1.5,
                      ),
                    ),
                    (vetItems.length <= 1)
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                height: _height * 0.1,
                                width: 215,
                                child: Center(
                                  child: CheckboxListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Sort by closeness"),
                                    value: _sortByProximity,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _sortByProximity = newValue;
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .platform, //  <-- leading Checkbox
                                  ),
                                ),
                              )
                            ],
                          ),
                    SingleChildScrollView(
                      child: Container(
                        height: _height * 0.815,
                        child: VetItemsGrid(
                            _showOnlyFavouriteItems,
                            _animalSettings,
                            _sortByProximity,
                            vetItemsData,
                            _height * 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
