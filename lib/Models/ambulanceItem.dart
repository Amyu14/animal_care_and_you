import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmbulanceItem with ChangeNotifier {
  final String id;
  final String name;
  final List<String> phoneNumber;
  final String timings;
  final double rating;
  final String ratingSource;
  final String area;
  final double lat;
  final double long;
  final String address;
  final String longAddress;
  bool isStarred;
  final String description;

  AmbulanceItem({
    @required this.id,
    @required this.name,
    @required this.phoneNumber,
    @required this.timings,
    @required this.area,
    this.rating,
    this.ratingSource,
    this.lat,
    this.long,
    this.address,
    this.longAddress,
    this.isStarred = false,
    this.description,
  });

  Future<void> toggleStarred() async {
    final orig = isStarred;
    isStarred = !isStarred;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("$id-isStarred", isStarred);
  }
}
