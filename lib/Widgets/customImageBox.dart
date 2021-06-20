import 'package:flutter/material.dart';

class CustomImageBox extends StatelessWidget {
  final String link;
  final double height;
  final double width;
  final double radius;

  CustomImageBox(
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
        child: Image.network(link, fit: BoxFit.cover),
      ),
    );
  }
}
