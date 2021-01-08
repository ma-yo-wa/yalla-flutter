import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/screens/login.dart';

class TextLink extends StatefulWidget {
  final String title;

  TextLink({this.title});
  @override
  _TextLinkState createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Have an account? Log In',
              style: textStyleInter.copyWith(
                  color: Color(0xff00A568),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
