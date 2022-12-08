import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/account_widget.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/bigText.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      //print("User has logged in");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(text: "Profile", size: 24, color: Colors.white),
      ),
      body: GetBuilder<UserController>(
        builder: (UserController) {
          return _userLoggedIn
              ? (UserController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // profile
                              AppIcon(
                                icon: Icons.person,
                                backgroundColor: AppColors.mainColor,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height15 * 5,
                                size: Dimensions.height15 * 10,
                              ),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              Column(
                                children: [
                                  //name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: UserController.userModel.name,
                                    ),
                                  ),

                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: UserController.userModel.phone,
                                    ),
                                  ),

                                  //email
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: UserController.userModel.email,
                                    ),
                                  ),

                                  //address
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Fill your adddress",
                                    ),
                                  ),

                                  //message
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Messages",
                                    ),
                                  ),

                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedDate();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      } else {
                                        print("You've logged out");
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.height10 * 5 / 2,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                        text: "Logout",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/image/not_sign_in.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                              child: BigText(
                                  text: "Sign In",
                                  color: Colors.white,
                                  size: Dimensions.font26),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
