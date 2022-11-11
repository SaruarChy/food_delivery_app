import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList =>
      _recommendedProductList; // this is for get this list from every where ;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.geRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];

      // addAll needs list of objects|| product.fromjson making list of object
      _recommendedProductList.addAll(Product.fromJson(response.body).Products);
      _isLoaded = true;
      print("got recommended product");
      // print(_popularProductList);
      update(); // its like setState

    } else {
      print("product not found ");
    }
  }
}
