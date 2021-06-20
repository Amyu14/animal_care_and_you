import 'package:animal_app/Screens/ambulancesScreen.dart';
import 'package:animal_app/Screens/ngoScreen.dart';
import 'package:animal_app/Screens/vetsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';

import './chemistAndPetStoresScreen.dart';
import '../Widgets/homeScreenOptionWidget.dart';
import './bestPracticesAndInfoPage.dart';
import '../Widgets/appDrawer.dart';
import './bestPracticesScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final optionValues = [
    {
      "title": "Contact NGOs",
      "icon": Icons.phone,
      "routeName": NgoScreen.routeName
    },
    {
      "title": "Best Practices & Vital Information",
      "icon": Icons.info,
      "routeName": BestPracticesScreen.routeName
    },
    {
      "title": "Animal Ambulance Services",
      "icon": FontAwesome.ambulance,
      "routeName": AmbulanceScreen.routeName,
    },
    {
      "title": "Vets Near Me",
      "icon": Icons.local_hospital,
      "routeName": VetsScreen.routeName,
    },
  ];

  @override
  Widget build(BuildContext context) {
    String appName = "Animal Care and You";

    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.blue[300], Colors.blue[700]],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 10.0));
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.pets),
            SizedBox(
              width: 10,
            ),
            Text(
              appName,
              style: GoogleFonts.oswald(),
            )
          ],
        ),
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only(right: 10),
        //     child: CircleAvatar(
        //       backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
        //       child: Icon(
        //         Icons.person,
        //         color: Theme.of(context).primaryColor,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              appName,
              style: GoogleFonts.bebasNeue(
                // ignore: deprecated_member_use
                textStyle: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.w300,
                      foreground: Paint()..shader = linearGradient,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ...optionValues
                .map((optionValue) => HomeScreenOptionWidget(
                    optionValue["title"],
                    optionValue["icon"],
                    optionValue["routeName"]))
                .toList(),
          ]),
      drawer: AppDrawer(),
    );
  }
}
