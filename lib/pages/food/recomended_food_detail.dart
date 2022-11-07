import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/utils/allDimension.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/bigText.dart';
import 'package:food_delivery_app/widgets/expandable_text_widtet.dart';

class RecomendedFoodDetail extends StatefulWidget {
  const RecomendedFoodDetail({super.key});

  @override
  State<RecomendedFoodDetail> createState() => _RecomendedFoodDetailState();
}

class _RecomendedFoodDetailState extends State<RecomendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: BigText(text: "chines slide", size: 26),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food2.jpg",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text:
                        "CFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarFlexibleSpaceBarrary to popular belief, Lorem Ipsum is not simply randomContrary to popular belief, Lorem Ipsum is not simply randomContrary to popular belief, Lorem Ipsum is not simply randomContrary to popular belief, Lorem Ipsum is not simply randomContrary to popular belief, Lorem Ipsum is not simply randomContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, e Finibus Bonorum et Malorum",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                    text: "\12.88" + "X" + "0",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
                    child: BigText(
                        text: "\$10 | Add to cart", color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
