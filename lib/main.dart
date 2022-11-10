import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recomended_food_detail.dart';
import 'package:food_delivery_app/pages/home/food_page_body.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:food_delivery_app/helper/dependencies.dart' as dep;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // for make sure dependencies are loaded correctly.
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    print("after controller call");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
