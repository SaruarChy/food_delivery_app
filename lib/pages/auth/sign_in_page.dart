import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/signup_body_model.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/bigText.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    var signUpImages = [
      "t.png",
      "f.jpg",
      "g.png",
    ];
    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        showCustomSnackBar("Type in your  email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid email", title: "Valid email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getInitial());
            // Get.toNamed(RouteHelper.getCartpage());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      // app logoo
                      Container(
                        height: Dimensions.screenHeight * 0.05,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.radius20 * 4,
                            backgroundImage: AssetImage(
                              "assets/image/logo_part_1.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      // welcome
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  fontSize:
                                      Dimensions.font20 + Dimensions.font20 / 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sing in to your account",
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey[500],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      // email
                      AppTextField(
                          textController: emailController,
                          hinText: "Email",
                          icon: Icons.email),
                      SizedBox(height: Dimensions.height20),

                      // password
                      AppTextField(
                        textController: passwordController,
                        hinText: "Password",
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(height: Dimensions.height20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20),
                            ),
                          ),
                          SizedBox(width: Dimensions.width20),
                        ],
                      ),
                      SizedBox(height: Dimensions.height30),
                      // sign up button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                                text: "Sign In",
                                size: Dimensions.font20 + Dimensions.font20 / 2,
                                color: Colors.white),
                          ),
                        ),
                      ),

                      // tag line
                      SizedBox(height: Dimensions.height10),

                      //sign up option
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      RichText(
                        text: TextSpan(
                          text: "Don\'t have an account?",
                          style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage(),
                                    transition: Transition.fade),
                              text: "Create",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : CustomLoader();
        },
      ),
    );
  }
}
