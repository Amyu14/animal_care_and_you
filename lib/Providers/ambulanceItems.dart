import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/petStoreAndChemistItem.dart';

class AmbulanceItems with ChangeNotifier {
  List<AmbulanceItem> _items = [];

  Future<void> itemsBuilder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<AmbulanceItem> items = [
      AmbulanceItem(
          id: "a1",
          name: "Ravi Kumar's Animal Ambulance",
          phoneNumber: ["9971079603"],
          timings: "9AM - 3PM",
          isStarred: prefs.getBool("a1-isStarred") ?? false,
          area:
              "Mainly operates in South Delhi - will cater to urgent requests in the NCR Region"),
      AmbulanceItem(
        id: "a2",
        name: "Gunjan's Animal Ambulance",
        phoneNumber: ["9810008633"],
        timings: "Throughout the day",
        isStarred: prefs.getBool("a2-isStarred") ?? false,
        area: "South Delhi",
      ),
      AmbulanceItem(
        id: "a3",
        name: "Aravind's Dog Ambulance",
        phoneNumber: ["9582204088"],
        area: "Delhi",
        timings: "Throughout the day",
        isStarred: prefs.getBool("a3-isStarred") ?? false,
      ),
      AmbulanceItem(
        id: "a4",
        name: "Uday's Dog Ambulance",
        phoneNumber: ["8800002030"],
        area: "Delhi",
        timings: "Throughout the day",
        isStarred: prefs.getBool("a4-isStarred") ?? false,
      ),
      AmbulanceItem(
        id: "a5",
        name: "Mangal's Animal Ambulance",
        phoneNumber: ["8826397928"],
        area: "South Delhi",
        timings: "Throughout the day",
        isStarred: prefs.getBool("a5-isStarred") ?? false,
      ),
    ];

    _items = items;
  }

  List<AmbulanceItem> get items {
    return [..._items];
  }

  List<AmbulanceItem> get starredItems {
    return _items.where((chemistItem) => chemistItem.isStarred).toList();
  }
}
