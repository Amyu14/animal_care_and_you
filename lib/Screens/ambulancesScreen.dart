import 'package:animal_app/Providers/ambulanceItems.dart';
import 'package:animal_app/Widgets/ambulanceItemsGrid.dart';
import 'package:animal_app/Widgets/petStoreItemsGrid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum FilterOptions { StarredItems, All }

class AmbulanceScreen extends StatefulWidget {
  static const routeName = "/chemist-screen";

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  var _showOnlyStarredItems = false;
  // var _sortByProximity = false; // change
  var _isInit = true;
  var _isLoading = true;

  AmbulanceItems ambulanceItemsData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      ambulanceItemsData = Provider.of<AmbulanceItems>(context, listen: false);
      ambulanceItemsData.itemsBuilder().then((value) {
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
    var ambulanceItems = _showOnlyStarredItems
        ? ambulanceItemsData.starredItems
        : ambulanceItemsData.items;
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal Ambulances Services"),
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
                child: Text("Show Only Favourite Items"),
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
                child: Column(children: [
                  SizedBox(
                    height: _height * 0.015,
                  ),
                  Container(
                    height: _height * 0.07,
                    child: FittedBox(
                      child: Text(
                        "Animal Ambulances",
                        style: GoogleFonts.oswald(
                          textStyle: Theme.of(context).textTheme.headline,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: _height * 0.915,
                    child: AmbulanceItemsGrid(
                        _showOnlyStarredItems, // change
                        ambulanceItemsData,
                        _height * 0.915),
                  ),
                ]),
              ),
            ),
    );
  }
}
