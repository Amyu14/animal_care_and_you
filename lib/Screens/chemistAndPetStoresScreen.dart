import 'package:animal_app/Screens/petStoresScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashed_container/dashed_container.dart';

import './bestPracticesScreen.dart';
import '../Widgets/backToHome.dart';
import 'ambulancesScreen.dart';

class ChemistAndPetStoresScreen extends StatelessWidget {
  static const routeName = "/chemist-and-pest-stores";

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
        title: Text("Pet Stores and Chemists"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(24, 0, 70, 0),
            child: Text(
              "Chemists and Pet Stores",
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                // ignore: deprecated_member_use
                textStyle: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(27, 15, 100, 15),
            child: RichText(
                text: TextSpan(
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.body1,
              ),
              children: <TextSpan>[
                TextSpan(text: "All the resources you need to become an "),
                TextSpan(
                    text: "Animal Hero",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.purple[700],
                    )),
                TextSpan(
                  text: ".",
                )
              ],
            )),
          ),
          SizedBox(
            height: 4,
          ),
          buildOptionTile("Pet Stores", Icons.store, Colors.purple[500],
              context, PetStoresScreen.routeName),
          SizedBox(
            height: 18,
          ),
          buildOptionTile("Chemists", Icons.medical_services,
              Colors.purple[500], context, AmbulanceScreen.routeName),
        ],
      ),
      floatingActionButton: BackToHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
