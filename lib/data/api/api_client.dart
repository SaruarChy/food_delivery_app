// import 'dart:async';

import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  bool allowAutoSignedCert = true;

  ApiClient({required this.appBaseUrl}) {
    token = AppConstants.TOKEN;
    baseUrl = appBaseUrl;
    timeout = Duration(microseconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; character =UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  // here response will come from getx
  Future<Response> getData(String uri) async {
    try {
      return await get(uri);
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
