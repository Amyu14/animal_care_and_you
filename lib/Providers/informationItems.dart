import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/informationItem.dart';

class InformationItems with ChangeNotifier {
  List<InformationItem> _items = [];

  List<InformationItem> get items {
    return [..._items];
  }

  List<InformationItem> get starredItems {
    return _items
        .where((informationItem) => informationItem.isStarred)
        .toList();
  }

  Future<void> fetchAndSetInformationItems() async {
    final url =
        "https://the-animal-app-default-rtdb.firebaseio.com/informationItems.json";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return;
    }

    final List<InformationItem> loadedItems = [];

    extractedData.forEach((itemId, itemData) {
      loadedItems.add(InformationItem(
        id: itemId,
        title: itemData["data"],
        imageUrl: itemData["imageUrl"],
        info: itemData["info"],
        isStarred: itemData["isStarred"],
      ));
    });

    _items = loadedItems;
    print(_items);
    notifyListeners();
  }
}
