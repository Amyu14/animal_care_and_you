import 'package:flutter/material.dart';

class CustomImageBoxAsset extends StatelessWidget {
  final String link;
  final double height;
  final double width;
  final double radius;

  CustomImageBoxAsset(
      {@required this.link,
      @required this.height,
      @required this.width,
      this.radius = 9});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: height,
        width: width,
        child: Image.asset(link, fit: BoxFit.cover),
      ),
    );
  }
}
