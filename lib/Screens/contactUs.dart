import 'dart:io';

import 'package:animal_app/Widgets/appDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final _emailAddress = "amyusaighal@gmail.com";

  TextEditingController _subjectController;
  TextEditingController _messageBodyController;

  @override
  void initState() {
    _subjectController = TextEditingController();
    _messageBodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageBodyController.dispose();
    super.dispose();
  }

  File _image;

  Future retrieveImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _send() async {
    final Email email = Email(
      recipients: [_emailAddress],
      subject: _subjectController.text,
      body: _messageBodyController.text,
      attachmentPaths: _image.path == null ? null : [_image.path],
    );

    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.84,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Contact Us",
                    style: GoogleFonts.oswald(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "If you have any queries, doubts or suggestions, please let us know.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _subjectController,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: "Subject",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _messageBodyController,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: "Body",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: FlatButton.icon(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue[500],
                                width: 1.5,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: retrieveImage,
                          icon:
                              Icon(_image == null ? Icons.photo : Icons.check),
                          label: Text(_image == null
                              ? "Click to upload a picture"
                              : "Picture Chosen"))),
                  SizedBox(
                    height: 14,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _send().then((_) {
                            print("Worked");
                            _subjectController.clear();
                            _messageBodyController.clear();
                            setState(() {
                              _image = null;
                            });
                          });
                        }
                      },
                      icon: Icon(Icons.send),
                      label: Text("Send")),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
