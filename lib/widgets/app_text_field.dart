import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hinText;
  final IconData icon;
  bool isObscure;
  AppTextField(
      {super.key,
      required this.textController,
      required this.hinText,
      required this.icon,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(1, 1),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          hintText: hinText,
          prefixIcon: Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          // enabled border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          // border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
          ),
        ),
      ),
    );
  }
}
