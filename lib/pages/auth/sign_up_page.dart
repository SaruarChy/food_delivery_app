import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/signup_body_model.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/bigText.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = [
      "t.png",
      "f.jpg",
      "g.png",
    ];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your  email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid email", title: "Valid email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        SignUpModel signUpModel = SignUpModel(
            name: nameController.text,
            phone: phone,
            email: email,
            password: password);
        authController.registration(signUpModel).then((status) {
          if (status.isSuccess) {
            print("success resgistration");
            Get.toNamed(RouteHelper.getInitial());
            //showCustomSnackBar("All went well", title: "Perfect");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
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
                        height: Dimensions.screenHeight * 0.15,
                      ),
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

                      //name
                      AppTextField(
                          textController: nameController,
                          hinText: "Name",
                          icon: Icons.person),
                      SizedBox(height: Dimensions.height20),
                      //phone
                      AppTextField(
                          textController: phoneController,
                          hinText: "Phone",
                          icon: Icons.phone),
                      SizedBox(height: Dimensions.height20),
                      // sign up button
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
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
                                text: "Sign Up",
                                size: Dimensions.font20 + Dimensions.font20 / 2,
                                color: Colors.white),
                          ),
                        ),
                      ),

                      // tag line
                      SizedBox(height: Dimensions.height10),
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already?",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20),
                        ),
                      ),
                      //sign up option
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      RichText(
                        text: TextSpan(
                          text: "Sign up using one of the following methods",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font16),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: Dimensions.radius30,
                              backgroundImage: AssetImage(
                                  "assets/image/" + signUpImages[index]),
                            ),
                          ),
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
