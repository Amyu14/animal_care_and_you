import 'package:animal_app/Screens/filterNGOsScreen.dart';
import 'package:animal_app/Screens/filterVetsScreen.dart';
import '../Models/ngoItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/ngoItemsGrid.dart';

enum FilterOptions {
  FavouriteItems,
  All,
}

class NgoScreen extends StatefulWidget {
  static const routeName = "/ngo-screen";

  @override
  _NgoScreenState createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {
  var _showOnlyFavouriteItems = false;
  var _animalSettings = AnimalSettings.All;
  var _ngoType = NgoType.All;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal NGOs"),
        actions: [
          // PopupMenuButton(
          //   onSelected: (FilterOptions selectedValue) {
          //     print(selectedValue);
          //     setState(() {
          //       if (selectedValue == FilterOptions.FavouriteItems) {
          //         _showOnlyFavouriteItems = true;
          //       } else {
          //         _showOnlyFavouriteItems = false;
          //       }
          //     });
          //   },
          //   icon: Icon(Icons.more_vert),
          //   itemBuilder: (_) => [
          //     PopupMenuItem(
          //       child: Text("Show All"),
          //       value: FilterOptions.All,
          //     ),
          //     PopupMenuItem(
          //       child: Text("Show Only Favourite Items"),
          //       value: FilterOptions.FavouriteItems,
          //     ),
          //   ],
          // ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => FilterNGOScreen(
                              _showOnlyFavouriteItems,
                              _animalSettings,
                              _ngoType)))
                      .then((value) {
                    print(value);
                    setState(() {
                      _showOnlyFavouriteItems = value[0];
                      _animalSettings = value[1];
                      _ngoType = value[2];
                    });
                  }))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _height * 0.02,
            ),
            Container(
              height: _height * 0.07,
              child: Column(
                children: [
                  Container(
                    height: _height * 0.05,
                    child: Text(
                      "Reputed NGOs in this Space",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.blue[700],
                    thickness: 1.7,
                    height: _height * 0.02,
                    indent: 8,
                    endIndent: 8,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: _height * 0.91,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: NgoItemsGrid(_showOnlyFavouriteItems, _animalSettings,
                    _ngoType, _height * 0.91),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
