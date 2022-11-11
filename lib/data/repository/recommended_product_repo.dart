import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> geRecommendedProductList() async {
    Response response = await apiClient.getData(AppConstants
        .RECOMENDED_PRODUCT_URI); // it will return statuscode 200 (success)
    return response;
  }
}
