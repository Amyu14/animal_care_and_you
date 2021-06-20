import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/ngoItem.dart';

class FilterNGOScreen extends StatefulWidget {
  final showOnlyFavouriteItems;
  final animalSettings;
  final ngoSettings;
  FilterNGOScreen(
      this.showOnlyFavouriteItems, this.animalSettings, this.ngoSettings);

  @override
  _FilterNGOScreenState createState() => _FilterNGOScreenState();
}

class _FilterNGOScreenState extends State<FilterNGOScreen> {
  static bool onlyFavourites = false;

  String _dropDownValue = "All Animals";
  List<String> _dropDownValuesList = [
    "All Animals",
    "Birds",
    "Cats",
    "Cows",
    "Dogs",
    "Wild Animals"
  ];

  String _ngoValue = "All NGOs";

  List<String> _ngoValuesList = [
    "All NGOs",
    "Shelters",
    "Medical Aid",
    "Rescues",
    "Campaigning / Advocacy"
  ];

  var _possibleNGOs = [
    NgoType.All,
    NgoType.Shelter,
    NgoType.MedicalAid,
    NgoType.Rescue,
    NgoType.Campaigning,
  ];

  var _possibleSettings = [
    AnimalSettings.All,
    AnimalSettings.Birds,
    AnimalSettings.Cats,
    AnimalSettings.Cows,
    AnimalSettings.Dogs,
    AnimalSettings.WildAnimals,
  ];

  static AnimalSettings selectedAnimalSetting = AnimalSettings.All;
  static NgoType selectedNGOType = NgoType.All;

  @override
  void initState() {
    onlyFavourites = widget.showOnlyFavouriteItems;
    selectedAnimalSetting = widget.animalSettings;
    selectedNGOType = widget.ngoSettings;
    _dropDownValue =
        _dropDownValuesList[_possibleSettings.indexOf(selectedAnimalSetting)];

    _ngoValue = _ngoValuesList[_possibleNGOs.indexOf(selectedNGOType)];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Filter NGOs"),
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
                "Show only favourite NGOs",
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
                    "NGO Settings",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  width: 230,
                  child: DropdownButton<String>(
                    value: _ngoValue,
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
                        _ngoValue = newValue;
                        selectedNGOType =
                            _possibleNGOs[_ngoValuesList.indexOf(newValue)];
                      });
                    },
                    items: _ngoValuesList
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    "Animal Settings",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  width: 230,
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
                        selectedAnimalSetting = _possibleSettings[
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
          Navigator.of(context)
              .pop([onlyFavourites, selectedAnimalSetting, selectedNGOType]);
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
