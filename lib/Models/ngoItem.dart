import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AnimalSettings { All, Cats, Dogs, Cows, Birds, WildAnimals }

enum NgoType { All, Shelter, MedicalAid, Rescue, Campaigning }

class NgoItem with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final List<String> phoneNumber;
  final List<String> emailAddress;
  final List<String> typeOfWork;
  final List<String> typeOfWorkLinks;
  final String address;
  final String longAddress;
  // final double lat;
  // final double long;
  final String rating;
  final String ratingSource;
  final String imageUrl;
  bool isFavourite;
  final List<AnimalSettings> animalSettings;
  final List<NgoType> ngoType;
  final String websiteLink;
  final String donationLink;

  NgoItem({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.phoneNumber,
    @required this.emailAddress,
    this.typeOfWork,
    this.typeOfWorkLinks,
    @required this.address,
    this.longAddress,
    // @required this.lat,
    // @required this.long,
    this.rating,
    this.ratingSource,
    @required this.imageUrl,
    this.isFavourite = false,
    @required this.animalSettings,
    @required this.ngoType,
    this.websiteLink,
    this.donationLink,
  });

  Future<void> toggleStarred() async {
    final orig = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("$id-isStarred", isFavourite);
  }
}
