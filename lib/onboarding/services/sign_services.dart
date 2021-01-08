import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/models/login_in_response.dart';
import 'package:flutter_application_1/onboarding/models/sign_up_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpServices {
  Dio myDio = Dio();

  Future signUp(data) async {
    final _pref = await SharedPreferences.getInstance();
    try {
      Response response = await myDio.post('$baseUrl/users', data: data);
      var res = SignUpResponse.fromJson(response.data);
      if(res.idToken.length > 0){
        _pref.setString('token', res.idToken);
        _pref.setString('email', res.email);
        _pref.setString('name', res.name);
      }
      return res;
    } on DioError catch(e){
      print(e.response.data);
      returnErrorMsg(e);
      return null;
    }
  }

  Future login(data) async {
    final _pref = await SharedPreferences.getInstance();
    try {
      Response response = await myDio.post('$baseUrl/auth', data: data);
      var res = LoginResponse.fromJson(response.data);

      if (res.idToken.isNotEmpty) {
        _pref.setString('token', res.idToken);
        _pref.setString('email', res.email);
        _pref.setString('name', res.name);
      }
      return res;
    } on DioError catch (e) {
      returnErrorMsg(e);
      return null;
    }
  }

  Future logout() async {
    final _pref = await SharedPreferences.getInstance();
    _pref.remove('token');
    _pref.remove('email');
    _pref.remove('name');
  }
}
