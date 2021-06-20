import 'dart:math';

import 'package:animal_app/Screens/ngoItemScreen.dart';
import 'package:animal_app/Widgets/customImageBox.dart';
import 'package:animal_app/Widgets/customImageBoxAsset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/ngoItem.dart';

class NgoItemWidget extends StatefulWidget {
  @override
  _NgoItemWidgetState createState() => _NgoItemWidgetState();
}

class _NgoItemWidgetState extends State<NgoItemWidget> {
  String firstHalf;
  String secondHalf;
  NgoItem ngoItem;

  int length = 75;
  final int _randomIndex = Random().nextInt(4);

  final List<Color> _colors = [
    Colors.blue[300],
    Colors.purple[300],
    Colors.red[300],
    Colors.amber[300]
  ];

  _makingPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // String getAssetLink(String id) {
  //   String assetLink = "";
  //   int num = int.parse(id.substring(1)) % 10;
  //   if (num == 1) {
  //     assetLink = "assets/dog1.jpg";
  //   } else if (num == 2) {
  //     assetLink = "assets/dog2.jpg";
  //   } else if (num == 3) {
  //     assetLink = "assets/cat.jpg";
  //   } else if (num == 4) {
  //     assetLink = "assets/bird1.jpg";
  //   } else if (num == 5) {
  //     assetLink = "assets/bird2.jpg";
  //   } else if (num == 6) {
  //     assetLink = "assets/dog3.jpg";
  //   } else if (num == 7) {
  //     assetLink = "assets/stray1.jpg";
  //   } else if (num == 8) {
  //     assetLink = "assets/stray2.jpg";
  //   } else if (num == 9) {
  //     assetLink = "assets/stray3.jpg";
  //   } else {
  //     assetLink = "assets/stray5.jpg";
  //   }
  //   return assetLink;
  // }

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    Color color = _colors[_randomIndex];

    ngoItem = Provider.of<NgoItem>(context);

    if (ngoItem.description.length <= length) {
      firstHalf = ngoItem.description;
      secondHalf = "";
    } else {
      while (ngoItem.description.length > length &&
          ngoItem.description.substring(length, length + 1) != " ") {
        length++;
      }
      firstHalf = ngoItem.description.substring(0, length);
      secondHalf = ngoItem.description.substring(length);
    }

    return Card(
      elevation: 2,
      shadowColor: color,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color == Colors.purple[300]
                    ? color.withOpacity(0.8)
                    : color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(
                ngoItem.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: CustomImageBoxAsset(
                height: 210,
                width: double.infinity,
                link: ngoItem.imageUrl,
              ),
            ),
            secondHalf.isEmpty
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      firstHalf,
                      style: GoogleFonts.nunito(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            flag ? firstHalf + "..." : firstHalf + secondHalf,
                            style: TextStyle(fontSize: 14.5),
                          )),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              flag ? "Show More" : "Show Less",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      )
                    ],
                  ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.phone),
                  ),
                  SizedBox(
                    width: 5.5,
                  ),
                  Column(
                    children: [
                      ...ngoItem.phoneNumber.map((phoneNumber) {
                        return InkWell(
                          onTap: () => _makingPhoneCall(phoneNumber),
                          child: Text(
                            phoneNumber,
                            style: GoogleFonts.nunito(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w600,
                              color: color == Colors.amber[300]
                                  ? Colors.amber[600]
                                  : color,
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Container(
            //   width: double.infinity,
            Row(
              children: [
                Container(
                  child: Icon(Icons.location_on),
                ),
                SizedBox(
                  width: 5.5,
                ),
                Expanded(
                  child: Text(
                    ngoItem.address,
                    style: GoogleFonts.nunito(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              elevation: 1,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NgoItemScreen(
                          ngoItem,
                          color,
                        )));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: color,
                    width: 2,
                  )),
              color: Colors.grey[200],
              child: Container(
                padding: EdgeInsets.all(2),
                child: Text("See More"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
