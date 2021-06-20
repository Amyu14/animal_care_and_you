import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:fdottedline/fdottedline.dart';

import '../Models/informationItem.dart';
import './customImageBox.dart';

class InformationItemWidget extends StatelessWidget {
  final List<Color> _colorOptions = [
    Colors.blue[500],
    Colors.red[500],
    Colors.pink[500],
    Colors.purple[500]
  ];

  @override
  Widget build(BuildContext context) {
    final Color _colorOption =
        _colorOptions[Random().nextInt(_colorOptions.length)];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: _colorOption, width: 2)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Consumer<InformationItem>(
          builder: (ctx, informationItem, unaffectedChild) => Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                informationItem.title == null
                    ? Container()
                    : Text(informationItem.title),
                informationItem.title == null
                    ? Container()
                    : Divider(
                        color: _colorOption.withOpacity(0.9),
                      ),
                informationItem.imageUrl == null
                    ? Container()
                    : CustomImageBox(
                        link: informationItem.imageUrl,
                        height: 175,
                        width: 400),
                informationItem.imageUrl == null
                    ? Container()
                    : Divider(
                        color: _colorOption.withOpacity(0.9),
                      ),
                Container(
                  child: Text(informationItem.info),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                // Divider(
                //   // indent: 20,
                //   // endIndent: 20,
                //   thickness: 1.2,
                // ),
                FDottedLine(
                  color: Colors.grey,
                  width: double.infinity,
                  strokeWidth: 0.6,
                  dottedLength: 7.5,
                  space: 2,
                ),
                Container(
                  child: IconButton(
                      color: _colorOption,
                      icon: Icon(informationItem.isStarred
                          ? Icons.star
                          : Icons.star_border),
                      onPressed: () => informationItem.toggleStarred()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
