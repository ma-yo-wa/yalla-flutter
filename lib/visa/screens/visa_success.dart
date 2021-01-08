import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/dashboard/screens/home_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';

class VisaApplicationSuccess extends StatefulWidget {
  final TripModel tripModel;

  VisaApplicationSuccess({this.tripModel});

  @override
  _VisaApplicationSuccessState createState() => _VisaApplicationSuccessState();
}

class _VisaApplicationSuccessState extends State<VisaApplicationSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'SUCCESS',
                      style: textStyleDMSan.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Colors.green,
                      )),
                  Container(
                    child: Text(
                      'Your Visa Application has been\ssubmitted. For further inquiries, please\ncontact help@yalla.ng',
                      style: textStyleDMSan,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  AppButton(
                    title: 'Home',
                    width: 250,
                    onPress: () {
                      nextPage(context, (context) => HomeLayout());
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
