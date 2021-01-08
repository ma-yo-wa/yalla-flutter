import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/dashboard/screens/home_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';

class BookingSuccess extends StatefulWidget {
  final TripModel tripModel;

  BookingSuccess({this.tripModel});

  @override
  _BookingSuccessState createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
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
                  'Your ${widget.tripModel.package} Package has been\nbooked. For further inquiries, please\ncontact help@yalla.ng',
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
