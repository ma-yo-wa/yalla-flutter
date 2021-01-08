import 'package:dio/dio.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/payment/models/payment_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentServices {
  Dio dio = Dio();

  Future fundAccount(data) async {
    try {
      final _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token');
      Response response = await dio.post('$baseUrl/card-topups',
          options: Options(headers: {"x-auth-token": token}), data: data);
      return response.data;
    } on DioError catch (e) {
      print(e.response.data);
      returnErrorMsg(e);
      return null;
    }
  }

  convertedHistory(history) {
    return PaymentHistoryModel(
        amount: history['amount'],
        gatewayResponse: history['gateway_response'],
        orderRef: history['order_ref'],
        paymentStatus: history['payment_status'],
        sId: history['_id'],
        transactionDate: history['transaction_date'],
        userEmail: history['user_email'],
        paymentReference: history['gateway_response']);
  }

  Future getPaymentHistory() async {
    try {
      final _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token');
      Response response = await dio.get('$baseUrl/card-topups/me',
          options: Options(headers: {"x-auth-token": token}));

      var paymentHistory = response.data.map(convertedHistory).toList();

      return paymentHistory;
    } on DioError catch (e) {
      print(e.response.data);
      returnErrorMsg(e);
      return null;
    }
  }
}
