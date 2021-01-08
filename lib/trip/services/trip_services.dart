import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/book_hotel_model.dart';
import 'package:flutter_application_1/trip/models/hotel_amenities_model.dart';
import 'package:flutter_application_1/trip/models/trip_deal_types.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/models/trip_travel_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TripServices {
  Dio dio = Dio();

  convertTrip(deal) {
    return TripDealTypeModel(
        dealType: deal['dealType'],
        amount: deal['amount'],
        name: deal['name'],
        color: deal['color'].replaceAll("#", ""),
        id: deal['_id']);
  }

  Future getDealTypes(dealType) async {
    final _pref = await SharedPreferences.getInstance();
    var token = _pref.getString('token');
    Response response = await dio.get('$baseUrl/deals?dealType=$dealType',
        options: Options(headers: {"x-auth-token": token}));

    var tripDeals = response.data.map(convertTrip).toList();

    return tripDeals;
  }

  Future getADeal(id) async {
    final _pref = await SharedPreferences.getInstance();
    var token = _pref.getString('token');
    Response response = await dio.get('$baseUrl/deals/$id',
        options: Options(headers: {"x-auth-token": token}));

    return HotelDetails.fromJson(response.data);
  }

  Future getTravelDates(id) async {
    final _pref = await SharedPreferences.getInstance();
    var token = _pref.getString('token');
    Response response = await dio.get('$baseUrl/deals/$id',
        options: Options(headers: {"x-auth-token": token}));

    return TripTravelDates.fromJson(response.data);
  }

  Future getAvailHotel(id, selectedRoom) async {
    final _pref = await SharedPreferences.getInstance();
    var token = _pref.getString('token');
    Response response = await dio.get('$baseUrl/deals/$id',
        options: Options(headers: {"x-auth-token": token}));
    var res = BookHotelModel.fromJson(response.data);
    var newRes = res.hotels.where((element) => element.roomType == selectedRoom).toList();
    return newRes;
  }

  Future makeBooking(data) async {
    try{
      final _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token');
      var convertedData = await convertDateToFormData(data);
      print(convertedData);
      Response response = await dio.post('$baseUrl/bookings',
          options: Options(headers: {"x-auth-token": token}), data: convertedData);
      return response.data;
    } on DioError catch(e){
      returnErrorMsg(e);
      return null;
    }

  }
  Future makeBookingWithWallet(data) async {
    try{
      final _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token');
      var convertedData = await convertDateToFormData(data);
      Response response = await dio.post('$baseUrl/bookings/wallet-charge',
          options: Options(headers: {"x-auth-token": token}), data: convertedData);
      return response.data;
    } on DioError catch(e){
      returnErrorMsg(e);
      return null;
    }

  }

  convertDateToFormData(TripModel data) async {
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
      "bookingFor": data.bookingFor,
      "dealType": data.dealType,
      "dealPackageId": data.dealPackageId,
      "breakFastIncluded": data.breakFastIncluded == null ? 'false' : data.breakFastIncluded.toString(),
      "lunchIncluded": data.lunchIncluded == null ? 'false' : data.lunchIncluded.toString(),
      "dinnerIncluded":data.dinnerIncluded == null ? 'false' : data.dinnerIncluded.toString(),
      "totalPackageAmount": data.totalPackageAmount,
      "tripStartDate": data.tripStartDate,
      "tripEndDate": data.tripEndDate,
      "paymentReference": data.paymentReference,
      "paymentStatus": data.paymentStatus,
      "gatewayResponse": 'Approved by Financial Institution',
    });

    return formData;
  }
}
