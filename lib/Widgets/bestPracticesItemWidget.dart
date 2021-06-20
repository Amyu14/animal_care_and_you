import 'dart:math';

import 'package:animal_app/Widgets/customImageBoxAsset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/bestPracticesItem.dart';
import './customImageBox.dart';

class BestPracticesItemWidget extends StatefulWidget {
  @override
  _BestPracticesItemWidgetState createState() =>
      _BestPracticesItemWidgetState();
}

class _BestPracticesItemWidgetState extends State<BestPracticesItemWidget> {
  final List<Color> _colorOptions = [
    Colors.blue[300],
    Colors.red[300],
    Colors.pink[300],
    Colors.purple[300]
  ];

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    final bestPracticesItem = Provider.of<BestPracticesItem>(context);

    Color colorOption;
    String categoryText = "Category: ";
    if (bestPracticesItem.category == Categories.ReportingCruelty) {
      colorOption = Colors.red[300];
      categoryText += "Reporting Animal Cruelty";
    } else if (bestPracticesItem.category == Categories.DiseaseResponse) {
      colorOption = Colors.purple[300];
      categoryText += "Dealing with Diseases";
    } else if (bestPracticesItem.category ==
        Categories.HelpingDistressedAnimal) {
      categoryText += "Helping Distressed Animals";
      colorOption = Colors.pink[300];
    } else if (bestPracticesItem.category == Categories.LifestyleChoices) {
      categoryText += "Lifestyle Choices";
      colorOption = Colors.blue[300];
    }

    double customWidth = 70;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: colorOption,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 6),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      bestPracticesItem.isStarred
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: colorOption,
                    ),
                    onPressed: () {
                      setState(() {
                        bestPracticesItem.toggleStarred();
                      });
                    }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: colorOption,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Text(
                    categoryText,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          bestPracticesItem.imageUrl == null
              ? Container()
              : CustomImageBoxAsset(
                  link: bestPracticesItem.imageUrl,
                  height: bestPracticesItem.customHight == 0
                      ? 180
                      : bestPracticesItem.customHight,
                  width: double.infinity),
          bestPracticesItem.imageUrl == null
              ? Container()
              : Divider(
                  thickness: 0.75,
                ),
          bestPracticesItem.diseaseOrSituation == null
              ? Container()
              : bestPracticesItem.isDisease
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: customWidth,
                          child: Text(
                            "Disease:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(bestPracticesItem.diseaseOrSituation)),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: customWidth,
                          child: Text(
                            "Situation:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(bestPracticesItem.diseaseOrSituation)),
                      ],
                    ),
          SizedBox(
            height: 5,
          ),
          bestPracticesItem.symptoms == null
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: customWidth,
                      child: Text(
                        "Symptoms:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: Text(bestPracticesItem.symptoms)),
                  ],
                ),
          SizedBox(
            height: 5,
          ),
          bestPracticesItem.diseaseOrSituation == null
              ? Text(bestPracticesItem.description)
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: customWidth,
                      child: Text(
                        "Possible Response:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: Text(bestPracticesItem.description)),
                  ],
                ),
          // ignore: deprecated_member_use
          bestPracticesItem.relevantLinks == null
              ? Container()
              : Column(
                  children: [
                    ...bestPracticesItem.relevantLinks.map((link) {
                      return Container(
                        width: double.infinity,
                        child: FlatButton(
                            onPressed: () => bestPracticesItem.linksInApp[
                                    bestPracticesItem.relevantLinks
                                        .indexOf(link)]
                                ? Navigator.of(context).pushNamed(link)
                                : _launchURL(link),
                            child: Text(bestPracticesItem.areLinksCustom[bestPracticesItem.relevantLinks.indexOf(link)]
                                ? bestPracticesItem.domainNames[
                                    bestPracticesItem.relevantLinks
                                        .indexOf(link)]
                                : "Learn more at ${bestPracticesItem.domainNames[bestPracticesItem.relevantLinks.indexOf(link)]}"),
                            color: Color.fromRGBO(235, 235, 235, 0.8),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: colorOption, width: 0.85),
                                borderRadius: new BorderRadius.circular(8.0))),
                      );
                    }).toList()
                  ],
                )
          // bestPracticesItem.relevantLinks == null
          //     ? Container()
          //     : Row(
          //         children: [
          //           Text(
          //             bestPracticesItem.relevantLinks.length == 1
          //                 ? "Relevant Link:"
          //                 : "Relevant Links:",
          //             style: TextStyle(fontWeight: FontWeight.w600),
          //           ),
          //           SizedBox(
          //             width: 6,
          //           ),
          //           Expanded(
          //             child: Column(
          //               children: [
          //                 ...bestPracticesItem.relevantLinks.map((link) {
          //                   return Column(
          //                     children: [
          //                       Text(link),
          //                       bestPracticesItem.relevantLinks.indexOf(link) ==
          //                               bestPracticesItem.relevantLinks.length -
          //                                   1
          //                           ? Container()
          //                           : SizedBox(
          //                               height: 4,
          //                             )
          //                     ],
          //                   );
          //                 }).toList()
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
        ],
      ),
    );
    // );
  }
}
