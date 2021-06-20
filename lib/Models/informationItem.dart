import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class InformationItem with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String info;
  bool isStarred;

  InformationItem({
    @required this.id,
    this.title,
    this.imageUrl,
    @required this.info,
    this.isStarred = false,
  });

  Future<void> toggleStarred() async {
    final url =
        "https://the-animal-app-default-rtdb.firebaseio.com/informationItems/${id}.json";

    final orig = isStarred;
    isStarred = !isStarred;
    notifyListeners();

    final response =
        await http.patch(url, body: json.encode({"isStarred": isStarred}));

    print(json.decode(response.body));
  }
}
