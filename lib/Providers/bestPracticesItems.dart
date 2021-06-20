import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/bestPracticesItem.dart';

class BestPracticesItems with ChangeNotifier {
  List<BestPracticesItem> _items = [];

  List<BestPracticesItem> get items {
    return [..._items];
  }

  List<BestPracticesItem> get starredItems {
    return _items
        .where((bestPracticesItem) => bestPracticesItem.isStarred)
        .toList();
  }

  Future<void> addBestPracticesItem(BestPracticesItem item) async {
    const url =
        "https://the-animal-app-default-rtdb.firebaseio.com/bestPracticesItems.json";
    final response = await http.post(url,
        body: json.encode({
          "diseaseOrSituation": item.diseaseOrSituation,
          "description": item.description,
          "response": item.response,
          "imageUrl": item.imageUrl,
          "isStarred": item.isStarred,
        }));

    final newProduct = BestPracticesItem(
      id: json.decode(response.body)["name"],
      category: Categories.ReportingCruelty,
      diseaseOrSituation: item.diseaseOrSituation,
      description: item.description,
      response: item.response,
      imageUrl: item.imageUrl,
      isStarred: item.isStarred,
    );

    _items.add(newProduct);

    notifyListeners();
  }

  Future<void> fetchAndSetBestPracticeItems() async {
    final url =
        "https://the-animal-app-default-rtdb.firebaseio.com/bestPracticesItems.json";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      print("nanana");
      return;
    }

    print(extractedData);

    extractedData.forEach((id, data) {
      print(data);
    });

    final List<BestPracticesItem> loadedItems = [];
    extractedData.forEach((itemId, itemData) {
      loadedItems.add(BestPracticesItem(
        id: itemId,
        category: Categories.ReportingCruelty,
        diseaseOrSituation: itemData["diseaseOrSituation"],
        description: itemData["description"],
        response: itemData["response"],
        imageUrl: itemData["imageUrl"],
        isStarred: itemData["isStarred"],
      ));
    });

    print("worked");

    _items = loadedItems;
    print(_items);
    notifyListeners();
  }
}
