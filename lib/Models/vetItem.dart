import 'package:animal_app/Models/ngoItem.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VetItem with ChangeNotifier {
  final String id;
  final String name;
  final List<String> phoneNumber;
  final String timings;
  final List<String> doctors;
  final String rating;
  final String ratingSource;
  final double lat;
  final double long;
  final String address;
  final String longAddress;
  bool isFavourite;
  final String description;
  List<AnimalSettings> animalSettings;

  VetItem({
    @required this.id,
    @required this.name,
    @required this.phoneNumber,
    @required this.timings,
    @required this.doctors,
    this.rating,
    this.ratingSource,
    @required this.lat,
    @required this.long,
    @required this.address,
    this.longAddress,
    this.isFavourite = false,
    this.description,
    @required this.animalSettings,
  });

  Future<void> toggleStarred() async {
    // final orig = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("$id-isFavourite", isFavourite);
  }
}
