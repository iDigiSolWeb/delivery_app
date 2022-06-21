import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_column.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: DimensionsCus.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/image/food0.png'))),
              )),
          Positioned(
              top: DimensionsCus.height55,
              left: DimensionsCus.width20,
              right: DimensionsCus.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: DimensionsCus.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: DimensionsCus.width20,
                  right: DimensionsCus.width20,
                  top: DimensionsCus.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(DimensionsCus.radius20),
                      topLeft: Radius.circular(DimensionsCus.radius20)),
                  color: Colors.white),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AppColum(text: 'Chinese Side'),
                SizedBox(
                  height: DimensionsCus.height20,
                ),
                BigText(text: 'Introduce')
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: DimensionsCus.bottomHeight, // 120,
        padding: EdgeInsets.only(
            top: DimensionsCus.height30,
            bottom: DimensionsCus.height30,
            left: DimensionsCus.width20,
            right: DimensionsCus.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(DimensionsCus.radius20 * 2),
                topLeft: Radius.circular(DimensionsCus.radius20 * 2))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: DimensionsCus.height20,
                bottom: DimensionsCus.height20,
                left: DimensionsCus.width30,
                right: DimensionsCus.width30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DimensionsCus.radius20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: DimensionsCus.width10,
                ),
                BigText(text: '0'),
                SizedBox(
                  width: DimensionsCus.width10,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.signColor,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: DimensionsCus.height20,
                bottom: DimensionsCus.height20,
                left: DimensionsCus.width20,
                right: DimensionsCus.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionsCus.radius20),
                color: AppColors.mainColor),
            child: BigText(
              text: '\$101.00 | Add to Cart',
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
