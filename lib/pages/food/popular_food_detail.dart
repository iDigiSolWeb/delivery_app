import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_column.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    // String BodyText =
    //     'Chicken marinated in a spiced yogurt is placed in a large pot then layered with fried onions fresh coriander,'
    //     ' then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with '
    //     'fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a '
    //     'large pot then layered with fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a'
    //     ' spiced yogurt is placed in a large pot then layered with fried onions fresh coriander, then par boiled spiced '
    //     'rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with fried onions fresh coriander,'
    //     ' then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with '
    //     'fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a '
    //     'large pot then layered with fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a'
    //     ' spiced yogurt is placed in a large pot then layered with fried onions fresh coriander, then par boiled spiced '
    //     'rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with fried onions fresh coriander,'
    //     ' then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with '
    //     'fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a '
    //     'large pot then layered with fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a'
    //     ' spiced yogurt is placed in a large pot then layered with fried onions fresh coriander, then par boiled spiced '
    //     'rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with fried onions fresh coriander,'
    //     ' then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot then layered with '
    //     'fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a spiced yogurt is placed in a '
    //     'large pot then layered with fried onions fresh coriander, then par boiled spiced rice.Chicken marinated in a'
    //     ' spiced yogurt is placed in a large pot then layered with fried onions fresh coriander, then par boiled spiced';
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
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              AppConstants.BASE_URL + AppConstants.UploadURL + product.img!))),
                )),
            Positioned(
                top: DimensionsCus.height55,
                left: DimensionsCus.width20,
                right: DimensionsCus.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(() => MainFoodPage());
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundcolour: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 3.2,
                                  top: 3,
                                  child: BigText(
                                    text:
                                        Get.find<PopularProductController>().totalItems.toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container()
                        ],
                      );
                    }),
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
                  AppColum(text: product.name!),
                  SizedBox(
                    height: DimensionsCus.height20,
                  ),
                  BigText(text: 'Introduce'),
                  SizedBox(
                    height: DimensionsCus.height20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: product.description!))),
                ]),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularproduct) {
            return Container(
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
                      GestureDetector(
                        onTap: () {
                          popularproduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: DimensionsCus.width10,
                      ),
                      BigText(text: popularproduct.inCartItems.toString()),
                      SizedBox(
                        width: DimensionsCus.width10,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularproduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
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
                  child: GestureDetector(
                    onTap: () {
                      popularproduct.addItem(product);
                    },
                    child: BigText(
                      text: '\$ ${product.price}  | Add to Cart',
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
            );
          },
        ));
  }
}
