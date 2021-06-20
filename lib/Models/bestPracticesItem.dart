import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Categories {
  All,
  ReportingCruelty,
  HelpingDistressedAnimal,
  DiseaseResponse,
  LifestyleChoices
}

class BestPracticesItem with ChangeNotifier {
  final String id;
  final String diseaseOrSituation;
  final bool isDisease;
  final String symptoms;
  final Categories category;
  final String description;
  final String response;
  final String imageUrl;
  final List<String> relevantLinks;
  final List<bool> areLinksCustom;
  final List<bool> linksInApp;
  final List<String> domainNames;
  final double customHight;
  bool isStarred;

  BestPracticesItem({
    @required this.id,
    this.diseaseOrSituation,
    this.isDisease,
    this.symptoms,
    @required this.description,
    @required this.category,
    this.response,
    this.imageUrl,
    this.relevantLinks,
    this.areLinksCustom,
    this.linksInApp,
    this.domainNames,
    this.customHight = 0,
    this.isStarred = false,
  });

  Future<void> toggleStarred() async {
    final orig = isStarred;
    isStarred = !isStarred;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("$id-isStarred", isStarred);
  }
}
