import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/petStoreAndChemistItem.dart';

class PetStoreItems with ChangeNotifier {
  List<AmbulanceItem> _items = [];

  Future<void> itemsBuilder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<AmbulanceItem> items = [
      // PetStoreAndChemistItem(
      //   id: "p1",
      //   name: "Store 1",
      //   phoneNumber: 9810547007,
      //   timings: "12AM - 8PM",
      //   isStarred: prefs.getBool("p1-isStarred") ?? false,
      //   rating: 83.4,
      //   ratingSource: "GOOGLE",
      //   address: "E111 Vasant Kunj",
      //   lat: 28.687149,
      //   long: 77.302963,
      // ),
      // PetStoreAndChemistItem(
      //   id: "p2",
      //   name: "Store 2",
      //   phoneNumber: 9810567007,
      //   timings: "11AM - 8PM",
      //   isStarred: prefs.getBool("p2-isStarred") ?? false,
      //   rating: 82.4,
      //   ratingSource: "GOOGLE",
      //   address: "E111 Vasant Kunj",
      //   lat: 30.687149,
      //   long: 77.302963,
      // ),
    ];

    _items = items;
  }

  List<AmbulanceItem> get items {
    return [..._items];
  }

  List<AmbulanceItem> get starredItems {
    return _items.where((petStoreItem) => petStoreItem.isStarred).toList();
  }
}
