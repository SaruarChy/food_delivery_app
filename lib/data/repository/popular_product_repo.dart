import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    Response response = await apiClient.getData(AppConstants
        .POPULAR_PRODUCT_URI); // it will return statuscode 200 (success)
    return response;
  }
}
