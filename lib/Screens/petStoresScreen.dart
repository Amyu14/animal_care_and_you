import 'package:animal_app/Providers/petStoreItems.dart';
import 'package:animal_app/Widgets/ambulanceItemsGrid.dart';
import 'package:animal_app/Widgets/petStoreItemsGrid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum FilterOptions { StarredItems, All }

class PetStoresScreen extends StatefulWidget {
  static const routeName = "/pet-store-screen";

  @override
  _PetStoresScreenState createState() => _PetStoresScreenState();
}

class _PetStoresScreenState extends State<PetStoresScreen> {
  var _showOnlyStarredItems = false;
  var _sortByProximity = false;
  var _isInit = true;
  var _isLoading = true;

  PetStoreItems petStoreItemsData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      petStoreItemsData = Provider.of<PetStoreItems>(context, listen: false);
      petStoreItemsData.itemsBuilder().then((value) {
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
    var petStoreItems = _showOnlyStarredItems
        ? petStoreItemsData.starredItems
        : petStoreItemsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Stores"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              print(selectedValue);
              setState(() {
                if (selectedValue == FilterOptions.StarredItems) {
                  _showOnlyStarredItems = true;
                } else {
                  _showOnlyStarredItems = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text("Show Only Starred Items"),
                value: FilterOptions.StarredItems,
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(children: [
                  Text(
                    "Pet Stores Near Me",
                    style: GoogleFonts.oswald(
                      textStyle: Theme.of(context).textTheme.headline,
                    ),
                  ),
                  (petStoreItems.length <= 1)
                      ? Container()
                      : Container(
                          width: 215,
                          child: CheckboxListTile(
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
                  PetStoreItemsGrid(_showOnlyStarredItems, _sortByProximity,
                      petStoreItemsData),
                ]),
              ),
            ),
    );
  }
}
