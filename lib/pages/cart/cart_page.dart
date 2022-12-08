import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/bigText.dart';
import 'package:food_delivery_app/widgets/smallText.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  // final String page;
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height10 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  // onTap: () {
                  //   if (page == "popularfood") {
                  //     Get.toNamed(RouteHelper.getPopularFood(pageId, page));
                  //   } else {
                  //     Get.toNamed(RouteHelper.recomendedFood);
                  //   }
                  // },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      // color: Colors.red,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: Dimensions.height20 * 5,
                                width: double.maxFinite,
                                // parent row for every items
                                child: Row(
                                  children: [
                                    //image
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularIndex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (recommendedIndex < 0) {
                                            Get.snackbar("History product",
                                                "Product review is not available for history product",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                colorText: Colors.white);
                                          } else {
                                            Get.toNamed(
                                                RouteHelper.getRecomendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.height20 * 5,
                                        height: Dimensions.height20 * 5,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!),
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.width10),
                                    // text
                                    Expanded(
                                      child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: cartController
                                                  .getItems[index].name!
                                                  .toString(),
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].price!
                                                      .toString(),
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: Dimensions.height10,
                                                      bottom:
                                                          Dimensions.height10,
                                                      left: Dimensions.width10,
                                                      right:
                                                          Dimensions.width10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: Dimensions
                                                                  .width10 /
                                                              2),
                                                      BigText(
                                                          text: _cartList[index]
                                                              .quantity!
                                                              .toString()),
                                                      SizedBox(
                                                          width: Dimensions
                                                                  .width10 /
                                                              2),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                  )
                : NoDataPage(text: "Your cart is empty");
          }),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: cartController.getItems.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: Dimensions.width10 / 2),
                            BigText(
                                text: "\$ " +
                                    cartController.totalAmount.toString()),
                            SizedBox(width: Dimensions.width10 / 2),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // popularProduct.addItem(product);
                          if (Get.find<AuthController>().userLoggedIn()) {
                            print("tapped");
                            cartController.addToHistory();
                          } else {
                            Get.toNamed(RouteHelper.getSignInPage());
                          }
                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getPaymaentPage());
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: BigText(
                              text: "Check Out",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
