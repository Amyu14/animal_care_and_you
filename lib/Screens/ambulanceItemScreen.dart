import 'dart:math';

import 'package:animal_app/Widgets/customImageBoxAsset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/petStoreAndChemistItem.dart';

class AmbulanceItemScreen extends StatefulWidget {
  final AmbulanceItem ambulanceItemData;
  AmbulanceItemScreen(this.ambulanceItemData);

  @override
  _AmbulanceItemScreenState createState() => _AmbulanceItemScreenState();
}

class _AmbulanceItemScreenState extends State<AmbulanceItemScreen> {
  Widget buildRow(IconData icon, String text) {
    return Container(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 6,
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }

  _makingPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String chooseImageLink() {
    int num = Random().nextInt(5);
    String link = "assets/Stray${num + 1}.jpg";
    return link;
  }

  @override
  Widget build(BuildContext context) {
    final link = chooseImageLink();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              //height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.ambulanceItemData.name,
                    style: GoogleFonts.oswald(
                      // ignore: deprecated_member_use
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: widget.ambulanceItemData.isStarred
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () => setState(() {
                      widget.ambulanceItemData.toggleStarred();
                    }),
                  )
                ],
              ),
            ),
            CustomImageBoxAsset(
                link: link, height: 200, width: double.infinity),
            Divider(),
            buildRow(Icons.location_on,
                "Address: ${widget.ambulanceItemData.longAddress ?? widget.ambulanceItemData.address}"),
            SizedBox(
              height: 9,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  // ignore: deprecated_member_use
                  Icon(Icons.phone),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Phone Number: ${widget.ambulanceItemData.phoneNumber}"),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 0.2,
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () => _makingPhoneCall(
                          widget.ambulanceItemData.phoneNumber[0]),
                      child: Text("Place Call"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 9,
            ),
            buildRow(Icons.watch_later,
                "Hours of Operation: ${widget.ambulanceItemData.timings}"),
          ],
        ),
      ),
    );
  }
}
