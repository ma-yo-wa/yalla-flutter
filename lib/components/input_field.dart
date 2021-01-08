import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  final Function validator;

  InputField({this.hintText, this.title, this.controller, this.validator});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textStyleDMSan.copyWith(
              fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 8,),
          Container(
            height: 60,
            child: TextFormField(
              decoration: secondaryDecoration.copyWith(
                hintText: widget.hintText,
              ),
              controller: widget.controller,
              validator: widget.validator == null ? (val){
                if(val.isEmpty){
                  return 'This is required';
                }

                return null;
              } : widget.validator,
            ),
          )
        ],
      ),
    );
  }
}
