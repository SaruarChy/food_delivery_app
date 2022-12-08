import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  // print("im using ")
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height20 * 5,
        width: Dimensions.width20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 5 / 2),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
