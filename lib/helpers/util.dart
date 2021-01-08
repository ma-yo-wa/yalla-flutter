import 'package:flutter/material.dart';
import 'package:flutter_application_1/onboarding/models/sign_up_error_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:number_display/number_display.dart';
import 'package:shared_preferences/shared_preferences.dart';

const textDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF0EFFF), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(0))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF0EFFF), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(0))),
  disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF0EFFF), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(0))),
  filled: true,
  fillColor: Color.fromRGBO(196, 196, 196, 0.1),
);

const secondaryDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF2F3F5), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(0))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF2F3F5), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(0))),
  disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF2F3F5), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(0))),
  filled: true,
  fillColor: Color.fromRGBO(196, 196, 196, 0.1),
);

const textStyleInter = TextStyle(fontFamily: 'Inter');

const textStyleDMSan = TextStyle(fontFamily: 'DMSans');

const appPrimaryColor = Color(0xffF2F3F5);

const primaryTextDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff9CEEC6), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(100))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff9CEEC6), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(100))),
  disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff9CEEC6), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(100))),
  filled: true,
  fillColor: Colors.white,
);

const baseUrl = 'https://api.yalla.ng/v1';

Future<bool> pageToast(message, color) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future checkIfAuth() async {
  final prefs = await SharedPreferences.getInstance();

  String token = prefs.getString('token');

  return {"token": token};
}

void returnErrorMsg(e) {
  var errorResponse = e.response.data;
  var res = SignUpErrorModel.fromJson(errorResponse);
  pageToast(res.message, Colors.red);
  return null;
}

var display = createDisplay(length: 16, decimal: 0);

String convertTravelDate(date) {
  var outputFormat = DateFormat("dd-MM-yyyy");
  var inputDate = outputFormat.parse(date);
  String myVar = Jiffy(inputDate).format("do MMM");
  return myVar;
}
String convertPaymentHistory(String date) {
  String myVar = Jiffy(date).format("EEE MMM d, HH:mm");
  return myVar;
}

void nextPage(context, component) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: component));
}

String publicKey = 'pk_test_71fc26a7f14fd880f19553955afd4d4d16ed6101';