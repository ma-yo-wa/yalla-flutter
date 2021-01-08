import 'package:dio/dio.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio mydio = Dio();

Future<Dio> baseMethod() async {
  final _pref = await SharedPreferences.getInstance();
  var token = _pref.getString('token');

  mydio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
    // Do something before request is sent
    print('token: $token');
    options.headers["x-auth-token"] = token;
    // options.baseUrl = baseUrl;
    return options;
  }));

  return mydio;
}
