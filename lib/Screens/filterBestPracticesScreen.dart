import 'package:animal_app/Models/bestPracticesItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/ngoItem.dart';

class FilterBestPracticesScreen extends StatefulWidget {
  final showOnlyFavouriteItems;
  final category;
  FilterBestPracticesScreen(this.showOnlyFavouriteItems, this.category);

  @override
  _FilterBestPracticesScreenState createState() =>
      _FilterBestPracticesScreenState();
}

class _FilterBestPracticesScreenState extends State<FilterBestPracticesScreen> {
  static bool onlyFavourites = false;

  String _dropDownValue = "All Categories";
  List<String> _dropDownValuesList = [
    "All Categories",
    "Reporting Animal Cruelty",
    "Dealing with Diseases",
    "Helping Distressed Animals",
    "Lifestyle Choices"
  ];

  var _possibleSettings = [
    Categories.All,
    Categories.ReportingCruelty,
    Categories.DiseaseResponse,
    Categories.HelpingDistressedAnimal,
    Categories.LifestyleChoices
  ];

  static Categories selectedCategory = Categories.All;

  @override
  void initState() {
    onlyFavourites = widget.showOnlyFavouriteItems;
    selectedCategory = widget.category;
    _dropDownValue =
        _dropDownValuesList[_possibleSettings.indexOf(selectedCategory)];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Filter Best Practices"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwitchListTile(
              title: Text(
                "Show only favourite items",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, color: Colors.blue[900]),
              ),
              value: onlyFavourites,
              onChanged: (newValue) {
                setState(() {
                  onlyFavourites = newValue;
                });
              },
              activeColor: Colors.blue[400],
            ),
            Divider(
              color: Colors.blue[200],
              thickness: 1.5,
              height: 25,
              indent: 6,
              endIndent: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    "Categories",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  width: 250,
                  child: DropdownButton<String>(
                    value: _dropDownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.blue[600],
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropDownValue = newValue;
                        selectedCategory = _possibleSettings[
                            _dropDownValuesList.indexOf(newValue)];
                      });
                    },
                    items: _dropDownValuesList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.nunito(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 1,
        backgroundColor: Colors.blue[300],
        onPressed: () {
          Navigator.of(context).pop([onlyFavourites, selectedCategory]);
        },
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text("Save Settings"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
