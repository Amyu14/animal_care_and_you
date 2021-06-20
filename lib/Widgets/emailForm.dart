import 'package:animal_app/Models/ngoItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:tinycolor/tinycolor.dart';

class EmailForm extends StatefulWidget {
  final Color color;
  final Color darkColor;
  final NgoItem ngoItem;
  EmailForm(this.color, this.darkColor, this.ngoItem);

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();

  final _subjectController = TextEditingController();

  final _bodyController = TextEditingController();

  FocusNode subjectNode = FocusNode();
  FocusNode bodyNode = FocusNode();

  @override
  void dispose() {
    subjectNode.dispose();
    bodyNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _send() async {
    final Email email = Email(
      recipients: [widget.ngoItem.emailAddress[0]],
      subject: _subjectController.text,
      body: _bodyController.text,
    );

    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    Color darkColor = widget.darkColor == Colors.amber[600]
        ? Colors.amber[800]
        : widget.darkColor;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Card(
          elevation: 4,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              children: [
                TextFormField(
                  focusNode: subjectNode,
                  // style: TextStyle(color: widget.darkColor),
                  controller: _subjectController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: "Subject",
                    labelStyle: subjectNode.hasFocus
                        ? TextStyle(color: darkColor)
                        : TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: widget.color, width: 1.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a subject";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  // style: TextStyle(color: widget.darkColor),
                  focusNode: bodyNode,
                  controller: _bodyController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: "Body",
                    labelStyle: bodyNode.hasFocus
                        ? TextStyle(color: darkColor)
                        : TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: widget.color, width: 1.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a body";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: widget.color,
                    child: Text(
                      "Send Email",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      if (_formKey.currentState.validate()) {
                        _send().then((_) {
                          Navigator.of(context).pop();
                          print("Worked");
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
