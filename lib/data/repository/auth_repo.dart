import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/models/signup_body_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClint;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClint, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClint.postData(
        AppConstants.REGISTRATION_URI, signUpModel.toJson());
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  bool userLoggedIn() {
    print("user logged in: " + AppConstants.TOKEN);
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(String email, String password) async {
    return await apiClint.postData(
        AppConstants.LOGIN_URI, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClint.token = token;
    apiClint.updateToken(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearSharedDate() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClint.token = "";
    apiClint.updateHeader("");

    return true;
  }
}
