import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/bigText.dart';
import 'package:food_delivery_app/widgets/expandable_text_widtet.dart';
// import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
// import 'package:food_delivery_app/widgets/smallText.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food5.jpg"),
                ),
              ),
            ),
          ),
          // icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_bag_outlined),
              ],
            ),
          ),
          //introduction of food

          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgHeight - 30,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(Dimensions.radius20),
                //   topRight: Radius.circular(Dimensions.radius20),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "chines slide"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  // expandable text
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              "braries in 342ms braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).(compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms).braries in 342ms (compile: 22 ms, reload: 0 ms, reassemble: 119 ms)."),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
        child: Row(
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
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child:
                    BigText(text: "\$10 | Add to cart", color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
