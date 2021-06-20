import 'package:animal_app/Screens/aboutUs.dart';
import 'package:animal_app/Screens/contactUs.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  void navigate(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushReplacementNamed(routeName);
  }

  Widget buildListTile(
      IconData icon, int num, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color: Colors.amber[num * 100],
      ),
      title: Text(
        title,
        style: GoogleFonts.archivoNarrow(
            textStyle: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        SizedBox(
          height: 12,
        ),
        buildListTile(Icons.home, 2, "Home", () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        buildListTile(Icons.people, 4, "About Us", () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return AboutUs();
          }));
        }),
        buildListTile(Icons.mail, 6, "Contact Us", () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return ContactUs();
          }));
        }),
      ],
    ));
  }
}
