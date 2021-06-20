import 'package:flutter/material.dart';
import '../Screens/homeScreen.dart';

class BackToHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 1,
      backgroundColor: Colors.blue[100],
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      icon: Icon(Icons.home),
      label: Text("Back To Home"),
    );
  }
}
