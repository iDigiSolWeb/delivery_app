import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/controllers/recommended_product_controller.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/routes/routes_helper.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  String page;
  RecommendedFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
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
    //     ' spiced yogurt is placed in a large pot then layered with fried onions fresh coriander, then par boiled spicedChicken marinated in a spiced yogurt is placed in a large pot then layered with fried onions fresh coriander,'
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == 'cartpage') {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1) Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
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
                      ),
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(DimensionsCus.radius20),
                        topRight: Radius.circular(DimensionsCus.radius20),
                      ),
                      color: Colors.white),
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: DimensionsCus.font26,
                  )),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UploadURL +
                      product.img!, //'assets/image/food0.png',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(right: DimensionsCus.width20, left: DimensionsCus.width20),
                    child: ExpandableTextWidget(
                      text: product.description!,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: DimensionsCus.width20 * 2.5,
                    right: DimensionsCus.width20 * 2.5,
                    top: DimensionsCus.height10,
                    bottom: DimensionsCus.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        backgroundcolour: AppColors.mainColor,
                        iconSize: DimensionsCus.iconsize24,
                      ),
                    ),
                    BigText(
                      text: '\$ ${product.price!}' + ' X ' + controller.inCartItems.toString(),
                      color: AppColors.mainBlackColor,
                      size: DimensionsCus.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundcolour: AppColors.mainColor,
                        iconSize: DimensionsCus.iconsize24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: DimensionsCus.height20,
                          bottom: DimensionsCus.height20,
                          left: DimensionsCus.width20,
                          right: DimensionsCus.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(DimensionsCus.radius20),
                          color: AppColors.mainColor),
                      child: BigText(
                        text: '\$ ${product.price! * controller.inCartItems} | Add to Cart',
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
            ],
          );
        }));
  }
}
