import 'package:dio/dio.dart';
import 'package:flutter_application_1/account/models/user_details.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices {
  Dio dio = Dio();

  Future getUserDetails() async {
    try{
      final _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token');
      Response response = await dio.get('$baseUrl/users/me',
          options: Options(headers: {"x-auth-token": token}));
      return UserDetails.fromJson(response.data);
    } on DioError catch(e){
      returnErrorMsg(e);
      return null;
    }
}

  Future getDetails () async {
    final _pref = await SharedPreferences.getInstance();
    var email = _pref.getString('email');
    var name = _pref.getString('name');

    return {"email": email, "name" : name};
  }
}