// import 'dart:async';

import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;
  bool allowAutoSignedCert = true;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    // ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(microseconds: 30);
    // token = AppConstants.TOKEN;
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    print("apiclient token : " + token);
    _mainHeaders = {
      'Content-type': 'application/json; character =UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  // here response will come from getx
  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }

  void updateToken(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; character =UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; character =UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> postData(String uri, dynamic body) async {
    print("inside apiCliden " + body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
