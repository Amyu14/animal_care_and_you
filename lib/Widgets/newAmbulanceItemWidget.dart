import 'package:animal_app/Models/petStoreAndChemistItem.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAmbulanceItemWidget extends StatefulWidget {
  @override
  _NewAmbulanceItemWidgetState createState() => _NewAmbulanceItemWidgetState();
}

class _NewAmbulanceItemWidgetState extends State<NewAmbulanceItemWidget> {
  _makingPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ambulanceItem = Provider.of<AmbulanceItem>(context);
    return Card(
      elevation: 1.5,
      shadowColor: Colors.blueAccent,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ambulanceItem.name,
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      ambulanceItem.toggleStarred();
                    });
                  },
                  icon: Icon(
                    ambulanceItem.isStarred
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  children: [
                    ...ambulanceItem.phoneNumber.map((number) {
                      return Column(
                        children: [
                          InkWell(
                              onTap: () => _makingPhoneCall(number),
                              child: Text(
                                number,
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                          ambulanceItem.phoneNumber.indexOf(number) ==
                                  ambulanceItem.phoneNumber.length - 1
                              ? Container()
                              : SizedBox(height: 5)
                        ],
                      );
                    }).toList(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(child: Text(ambulanceItem.area))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.watch_later,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(ambulanceItem.timings)
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
