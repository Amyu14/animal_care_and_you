import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/backToHome.dart';
import './bestPracticesScreen.dart';
import './informationScreen.dart';

class BestPracticesAndInfoPage extends StatelessWidget {
  static const routeName = "/best-practices-and-info";

  Widget buildOptionTile(String optionName, IconData iconName,
      Color colorChoice, BuildContext ctx, String routeName) {
    return InkWell(
      onTap: () {
        Navigator.of(ctx).pushNamed(routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: DashedContainer(
          dashColor: colorChoice,
          borderRadius: 14,
          dashedLength: 300,
          blankLength: 0,
          strokeWidth: 2.5,
          child: Container(
            width: double.infinity,
            height: 100,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2.5,
              child: Container(
                width: 20,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      iconName,
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      optionName,
                      style: GoogleFonts.oswald(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Best Practices & Vital Information"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              "Best Practices and Vital Information",
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                // ignore: deprecated_member_use
                textStyle: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
            child: RichText(
                text: TextSpan(
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.body1,
              ),
              children: <TextSpan>[
                TextSpan(text: "Everything you need to know to become an "),
                TextSpan(
                    text: "Animal Hero",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.blue[700],
                    )),
                TextSpan(
                  text: ".",
                )
              ],
            )),
          ),
          buildOptionTile("Best Practices", Icons.thumb_up,
              Colors.blueAccent[400], context, BestPracticesScreen.routeName),
          SizedBox(height: 19),
          buildOptionTile(
              "Essential Information",
              Icons.perm_device_information,
              Colors.blueAccent[400],
              context,
              EssentialInformationScreen.routeName),
        ],
      ),
      floatingActionButton: BackToHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
