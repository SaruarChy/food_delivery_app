import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList =>
      _popularProductList; // this is for get this list from every where ;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];

      // addAll needs list of objects|| product.fromjson making list of object
      _popularProductList.addAll(Product.fromJson(response.body).Products);
      print("got product");
      // print(_popularProductList);
      update(); // its like setState

    } else {
      print("product not found ");
    }
  }
}
