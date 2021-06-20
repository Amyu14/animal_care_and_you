import 'dart:math';

import 'package:animal_app/Models/vetItem.dart';
import 'package:animal_app/Screens/vetItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VetItemWidget extends StatelessWidget {
  final VetItem vetItem;
  VetItemWidget(this.vetItem);

  final List<Color> _colors = [
    Colors.blue[300],
    Colors.purple[300],
    Colors.pink[300],
  ];

  final int _randomIndex = Random().nextInt(3);

  Widget buildListTile(String titleText, String subText, Color color) {
    return ListTile(
      title: Text(titleText,
          style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      subtitle: InkWell(
        child: Text(
          subText,
        ),
      ),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = _colors[_randomIndex];
    String doctorText = vetItem.doctors.length == 1 ? "Doctor" : "Doctors";
    String phoneNumText =
        vetItem.phoneNumber.length == 1 ? "Phone Number" : "Phone Numbers";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: color,
            ),
            padding: EdgeInsets.all(6),
            child: Text(
              vetItem.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
            width: double.infinity,
          ),
          SizedBox(
            height: 16,
          ),
          vetItem.doctors.length == 0
              ? Container()
              : vetItem.doctors.length == 1
                  ? buildListTile("Doctor", vetItem.doctors[0], color)
                  : ListTile(
                      title: Text(
                        "Doctors",
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: vetItem.doctors.map((doctorText) {
                          return Text(
                            doctorText,
                          );
                        }).toList(),
                      ),
                    ),
          vetItem.phoneNumber.length == 1
              ? buildListTile("Phone Number", vetItem.phoneNumber[0], color)
              : ListTile(
                  title: Text(
                    "Phone Numbers",
                    style: TextStyle(color: color, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: vetItem.phoneNumber.map((phoneNum) {
                      return Text(
                        phoneNum,
                      );
                    }).toList(),
                  ),
                ),
          buildListTile("Location", vetItem.address, color),
          buildListTile("Timings", vetItem.timings, color),
          SizedBox(
            height: 6,
          ),
          Container(
            width: double.infinity,
            child: Center(
              // ignore: deprecated_member_use
              child: RaisedButton(
                elevation: 1,
                child: Text("See More"),
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: color, width: 1.5)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return VetItemScreen(vetItem, color);
                  }));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
