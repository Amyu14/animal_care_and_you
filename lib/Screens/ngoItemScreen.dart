import 'package:animal_app/Models/ngoItem.dart';

import 'package:animal_app/Widgets/customImageBoxAsset.dart';
import 'package:animal_app/Widgets/emailForm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NgoItemScreen extends StatefulWidget {
  NgoItem ngoItem;
  Color color;

  NgoItemScreen(NgoItem ngoItem, Color color) {
    this.ngoItem = ngoItem;
    this.color = color == Colors.amber[300] ? Colors.amber[500] : color;
  }

  @override
  _NgoItemScreenState createState() => _NgoItemScreenState();
}

class _NgoItemScreenState extends State<NgoItemScreen> {
  Color get boldColor {
    if (widget.color == Colors.blue[300]) {
      return Colors.blue[500];
    } else if (widget.color == Colors.purple[300]) {
      return Colors.purple[500];
    } else if (widget.color == Colors.red[300]) {
      return Colors.red[500];
    } else {
      return Colors.amber[600];
    }
  }

  _makingPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Widget buildRow(IconData iconName, String text, Color color) {
    return Row(
      children: [
        Icon(
          iconName,
          color: color,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String websiteText = widget.ngoItem.name.contains(",")
        ? widget.ngoItem.name.substring(0, widget.ngoItem.name.indexOf(","))
        : widget.ngoItem.name;

    if (websiteText.toLowerCase().endsWith("s")) {
      websiteText += "'";
    } else {
      websiteText += "'s";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ngoItem.name),
        backgroundColor: widget.color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3,
              ),
              Container(
                // padding: EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.ngoItem.name.length >= 40
                        ? Expanded(
                            child: Text(
                              widget.ngoItem.name,
                              style: GoogleFonts.oswald(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        : Text(
                            widget.ngoItem.name,
                            style: GoogleFonts.oswald(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                    IconButton(
                        icon: widget.ngoItem.isFavourite
                            ? Icon(
                                Icons.favorite,
                                color: widget.color,
                              )
                            : Icon(Icons.favorite_border, color: widget.color),
                        onPressed: () {
                          setState(() {
                            widget.ngoItem.toggleStarred();
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              CustomImageBoxAsset(
                link: widget.ngoItem.imageUrl,
                height: 230,
                width: double.infinity,
                radius: 0,
              ),
              Divider(
                height: 28,
                indent: 10,
                endIndent: 10,
                thickness: 1.8,
                color: widget.color.withOpacity(0.5),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  widget.ngoItem.description,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                height: 28,
                indent: 10,
                endIndent: 10,
                thickness: 1.8,
                color: widget.color.withOpacity(0.5),
              ),
              Row(
                children: [
                  buildRow(Icons.phone, "Phone number: ", widget.color),
                  Column(
                    children: [
                      ...widget.ngoItem.phoneNumber.map((phoneNumber) {
                        return Column(
                          children: [
                            InkWell(
                              // TODO: Make list of phone numbers
                              onTap: () => _makingPhoneCall(phoneNumber),
                              child: Expanded(
                                child: Text(
                                  phoneNumber,
                                  style: TextStyle(
                                    color: boldColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            widget.ngoItem.phoneNumber.indexOf(phoneNumber) ==
                                    widget.ngoItem.phoneNumber.length - 1
                                ? Container()
                                : SizedBox(height: 2),
                          ],
                        );
                      }).toList()
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 13.6,
              ),
              Row(
                children: [
                  buildRow(Icons.email, "Email address: ", widget.color),
                  Column(
                    children: [
                      ...widget.ngoItem.emailAddress.map((email) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return EmailForm(widget.color, boldColor,
                                          widget.ngoItem);
                                    });
                              },
                              child: Flexible(
                                child: Text(
                                  email,
                                  style: TextStyle(
                                    color: boldColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.6,
                                  ),
                                ),
                              ),
                            ),
                            widget.ngoItem.emailAddress.indexOf(email) ==
                                    widget.ngoItem.emailAddress.length - 1
                                ? Container()
                                : SizedBox(height: 2),
                          ],
                        );
                      }).toList()
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 13.6,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: widget.color,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Address: ${widget.ngoItem.address}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              // buildRow(Icons.location_on, "Address: ${widget.ngoItem.address}",
              //     widget.color),
              widget.ngoItem.rating == null
                  ? Container()
                  : SizedBox(
                      height: 13.6,
                    ),
              widget.ngoItem.rating == null
                  ? Container()
                  : buildRow(
                      Icons.star_rate,
                      "Rating: ${widget.ngoItem.rating} on ${widget.ngoItem.ratingSource}",
                      widget.color),

              SizedBox(
                height: 6,
              ),
              // ignore: deprecated_member_use
              FlatButton.icon(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.color),
                  ),
                  color: Colors.grey[100],
                  splashColor: widget.color.withOpacity(0.5),
                  onPressed: () => _launchURL(widget.ngoItem.websiteLink),
                  icon: Icon(
                    Entypo.browser,
                    color: Colors.grey[900],
                  ),
                  label: Text(
                    "$websiteText website",
                    style: GoogleFonts.nunito(
                        color: Colors.grey[900], fontSize: 15),
                  )),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
