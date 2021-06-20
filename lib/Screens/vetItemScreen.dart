import 'package:animal_app/Models/vetItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class VetItemScreen extends StatefulWidget {
  final VetItem vetItem;
  final Color color;
  VetItemScreen(this.vetItem, this.color);
  @override
  _VetItemScreenState createState() => _VetItemScreenState();
}

class _VetItemScreenState extends State<VetItemScreen> {
  _makingPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildNewListTile(IconData iconName, String text, String info) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconName,
          color: widget.color,
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                info,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget buildNewListTileColumn(
      IconData iconName, String text, List<String> info) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconName,
          color: widget.color,
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            ...info
                .map((string) => Column(
                      children: [
                        Text(string),
                        string == info.last
                            ? Container()
                            : SizedBox(
                                height: 3,
                              )
                      ],
                    ))
                .toList(),
          ],
        )
      ],
    ));
  }

  Widget buildNewPhoneNumberColumn(
      IconData iconName, String text, List<String> phoneNumbers) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconName,
          color: widget.color,
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            ...phoneNumbers
                .map((phoneNumber) => Column(
                      children: [
                        InkWell(
                          child: Text(
                            phoneNumber,
                            style: TextStyle(
                                color: widget.color,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            _makingPhoneCall(phoneNumber);
                          },
                        ),
                        phoneNumber == phoneNumbers.last
                            ? Container()
                            : SizedBox(
                                height: 3,
                              )
                      ],
                    ))
                .toList(),
          ],
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    String doctorText =
        widget.vetItem.doctors.length == 1 ? "Doctor" : "Doctors";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.vetItem.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.vetItem.name,
                          style: GoogleFonts.oswald(fontSize: 22),
                        ),
                        IconButton(
                            color: widget.color,
                            icon: Icon(widget.vetItem.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                widget.vetItem.toggleStarred();
                              });
                            })
                      ],
                    ),
                  ),
                  widget.vetItem.description == null
                      ? Container()
                      : Text(
                          widget.vetItem.description,
                          textAlign: TextAlign.left,
                        ),
                ],
              ),
              Divider(
                indent: 8,
                endIndent: 8,
                thickness: 1.5,
              ),
              widget.vetItem.doctors.length != 0
                  ? buildNewListTileColumn(Icons.medical_services, doctorText,
                      widget.vetItem.doctors)
                  : Container(),
              widget.vetItem.doctors.length != 0
                  ? SizedBox(
                      height: 14,
                    )
                  : Container(),
              buildNewPhoneNumberColumn(
                  Icons.phone, "Phone Number", widget.vetItem.phoneNumber),
              SizedBox(
                height: 14,
              ),
              buildNewListTile(Icons.location_on, "Address",
                  widget.vetItem.longAddress ?? widget.vetItem.address),
              SizedBox(
                height: 14,
              ),
              buildNewListTile(
                  Icons.watch_later, "Timings", widget.vetItem.timings),
              SizedBox(
                height: 14,
              ),
              widget.vetItem.rating == null
                  ? Container()
                  : buildNewListTile(
                      Icons.star_rate,
                      "Rating",
                      "${widget.vetItem.rating} on ${widget.vetItem.ratingSource}",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
