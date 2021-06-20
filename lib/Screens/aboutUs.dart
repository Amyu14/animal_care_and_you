import 'package:animal_app/Widgets/appDrawer.dart';
import 'package:animal_app/Widgets/customImageBox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Us",
                textAlign: TextAlign.center,
                style: GoogleFonts.barlowCondensed(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageBox(
                  radius: 2,
                  link:
                      "https://images.pexels.com/photos/3614358/pexels-photo-3614358.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  height: 270,
                  width: double.infinity),
              Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
                thickness: 10,
                height: 30,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
