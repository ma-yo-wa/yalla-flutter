import 'package:dio/dio.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisaServices {
  Dio dio = Dio();

  Future submitVisaApplication(data) async {
    try{
      final _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token');
      var convertedData = await convertVisaToFormData(data);
      Response response = await dio.post('$baseUrl/visa',
          options: Options(headers: {"x-auth-token": token}), data: convertedData);
      return response.data;
    } on DioError catch(e){
      print('${e.response.data}');
      returnErrorMsg(e);
      return null;
    }

  }

  convertVisaToFormData(TripModel data) async {
    var filename =
        data.passportDataPage.path.split('/').last;

    FormData formData = new FormData.fromMap({
      "surname": data.surname,
      "givenName": data.givenName,
      "passportNumber": data.passportNumber,
      "gender": data.gender,
      "nationality": data.nationality,
      "stateOfOrigin": data.stateOfOrigin,
      "maritalStatus": data.maritalStatus,
      "placeOfWork": data.placeOfWork,
      "occupation": data.occupation,
      "phoneNumber": data.phoneNumber,
      "email": data.email,
      "whatsappNumber": data.whatsappNumber,
      "nextOfKinName": data.nextOfKinName,
      "relationshipWithNextOfKin": data.relationshipWithNextOfKin,
      "nextOfKinAddress": data.nextOfKinAddress,
      "nextOfKinEmail": data.nextOfKinEmail,
      "nextOfKinPhoneNumber": data.nextOfKinPhoneNumber,
      "passportDataPage": await MultipartFile.fromFile(data.passportDataPage.path, filename: filename),
    });

    return formData;
  }
}