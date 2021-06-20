import 'package:animal_app/Models/bestPracticesItem.dart';
import 'package:animal_app/Screens/filterBestPracticesScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../Providers/bestPracticesItems.dart';
import '../Widgets/bestPracticesItemsGrid.dart';
import '../Widgets/backToHome.dart';

enum FilterOptions { StarredItems, All }

class BestPracticesScreen extends StatefulWidget {
  static const routeName = "/best-practices-screen";

  @override
  _BestPracticesScreenState createState() => _BestPracticesScreenState();
}

class _BestPracticesScreenState extends State<BestPracticesScreen> {
  var _showOnlyStarredItems = false;
  var _category = Categories.All;
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);

    print("it worked");
    return Scaffold(
      appBar: AppBar(
        title: Text("Best Practices"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FilterBestPracticesScreen(
                      _showOnlyStarredItems, _category);
                })).then((value) {
                  setState(() {
                    _showOnlyStarredItems = value[0];
                    _category = value[1];
                  });
                });
              })
        ],
        // actions: [
        //   PopupMenuButton(
        //     onSelected: (FilterOptions selectedValue) {
        //       print(selectedValue);
        //       setState(() {
        //         if (selectedValue == FilterOptions.StarredItems) {
        //           _showOnlyStarredItems = true;
        //         } else {
        //           _showOnlyStarredItems = false;
        //         }
        //       });
        //     },
        //     icon: Icon(Icons.more_vert),
        //     itemBuilder: (_) => [
        //       PopupMenuItem(
        //         child: Text("Show All"),
        //         value: FilterOptions.All,
        //       ),
        //       PopupMenuItem(
        //         child: Text("Show Only Favourite Items"),
        //         value: FilterOptions.StarredItems,
        //       ),
        //     ],
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.015,
              ),
              Container(
                height: _height * 0.05,
                child: Text(
                  "Information and Best Practices",
                  style: GoogleFonts.oswald(fontSize: 23.5),
                ),
              ),
              Container(
                  height: _height * 0.935,
                  child: BestPracticesItemsGrid(
                      _showOnlyStarredItems, _category, _height * 0.935))
            ],
          ),
        ),
      ),
    );
  }
}
