import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // apiclient

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // we did it for first we want load api client.apiClient takes base url and
  // we are passing the baseurl to it. and it will save it to Getx inside iternalley

//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //we are inside getx package once
  // we write apiClient: Get.find() getx will find it for it.this name `apiClient` hast to be same mention over ApiClient class

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}