import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';

class EmailInputField extends StatefulWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;

  EmailInputField({this.hintText, this.title, this.controller});

  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textStyleDMSan.copyWith(
              fontSize: 18
          ),),
          SizedBox(height: 8,),
          TextFormField(
            decoration: secondaryDecoration.copyWith(
                hintText: widget.hintText
            ),
            controller: widget.controller,
            validator: (val) =>
            EmailValidator.validate(val)
                ? null
                : "Please enter a valid email",
          )
        ],
      ),
    );
  }
}
