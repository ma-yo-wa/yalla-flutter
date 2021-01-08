import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';

class SignUpContainer extends StatefulWidget {
  final Widget child;

  SignUpContainer({this.child});

  @override
  _SignUpContainerState createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: textStyleDMSan.copyWith(
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.green,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          child: widget.child,
        )
    );
  }
}
