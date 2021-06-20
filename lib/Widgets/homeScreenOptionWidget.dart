import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenOptionWidget extends StatelessWidget {
  final String optionText;
  final IconData optionIcon;
  final routeName;

  HomeScreenOptionWidget(this.optionText, this.optionIcon, this.routeName);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: make the MediaQuery object constant

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 10,
      ),
      child: Card(
        elevation: 3,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(optionIcon),
            ),
            title: Text(
              optionText,
              style: GoogleFonts.abel(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w600,
              )),
            ),
            trailing: FlatButton.icon(
              onPressed: () => Navigator.of(context).pushNamed(routeName),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                "LEARN MORE",
                style: GoogleFonts.heebo(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              color: Colors.purple[200],
            ),
          ),
        ),
      ),
    );
  }
}
