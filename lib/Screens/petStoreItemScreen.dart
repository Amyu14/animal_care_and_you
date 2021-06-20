import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/petStoreAndChemistItem.dart';

class PetStoreItemScreen extends StatefulWidget {
  final AmbulanceItem petStoreItemData;
  PetStoreItemScreen(this.petStoreItemData);

  @override
  _PetStoreItemScreenState createState() => _PetStoreItemScreenState();
}

class _PetStoreItemScreenState extends State<PetStoreItemScreen> {
  Widget buildRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(text)
      ],
    );
  }

  _makingPhoneCall(int phoneNumber) async {
    final url = 'tel:${phoneNumber}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.petStoreItemData.name,
                    style: GoogleFonts.oswald(
                      // ignore: deprecated_member_use
                      textStyle: Theme.of(context).textTheme.headline,
                    ),
                  ),
                  IconButton(
                    icon: widget.petStoreItemData.isStarred
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () => setState(() {
                      widget.petStoreItemData.toggleStarred();
                    }),
                  )
                ],
              ),
            ),
            Divider(),
            widget.petStoreItemData.description == null
                ? Container()
                : Text(widget.petStoreItemData.description),
            widget.petStoreItemData.description == null
                ? Container()
                : Divider(),
            buildRow(Icons.location_on,
                "Address: ${widget.petStoreItemData.longAddress ?? widget.petStoreItemData.address}"),
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
                  Text("Phone Number: ${widget.petStoreItemData.phoneNumber}"),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 0.2,
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () => _makingPhoneCall(9),
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
                "Timings: ${widget.petStoreItemData.timings}"),
            SizedBox(
              height: 9,
            ),
            widget.petStoreItemData.rating == null
                ? Container()
                : buildRow(Icons.star_rate,
                    "Rating: ${widget.petStoreItemData.rating} on ${widget.petStoreItemData.ratingSource}"),
          ],
        ),
      ),
    );
  }
}
