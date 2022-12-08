// import 'dart:ffi';

import 'package:food_delivery_app/pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail.dart.dart';
import 'package:food_delivery_app/pages/home/home_page.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/payment/payment_page.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const splashPage = "/splash-page";
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recomendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String paymentPage = "/payment-page";
  static const String orderSuccess = '/order-successful';
  // static const String orderSuccess = '/order-successful';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  static String getRecomendedFood(int pageId, String page) =>
      '$recomendedFood?pageId=$pageId&page=$page';

  static String getCartpage() => '$cartPage';

  static String getSignInPage() => '$signIn';
  static String getPaymaentPage() => '$paymentPage';
  static String getPaym() => '$paymentPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        // int id = int.parse(pageId!);
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recomendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
    ),
    GetPage(
      name: cartPage,
      page: () {
        // var page = Get.parameters['page'];
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: paymentPage,
      page: () {
        // var page = Get.parameters['page'];
        return PaymentPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
