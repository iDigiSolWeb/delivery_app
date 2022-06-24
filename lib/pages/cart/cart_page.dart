import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/controllers/recommended_product_controller.dart';
import 'package:delivery_app/routes/routes_helper.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: DimensionsCus.width20,
              top: DimensionsCus.height20 * 3,
              right: DimensionsCus.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundcolour: AppColors.mainColor,
                      iconSize: DimensionsCus.iconsize24,
                    ),
                  ),
                  SizedBox(
                    width: DimensionsCus.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundcolour: AppColors.mainColor,
                      iconSize: DimensionsCus.iconsize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundcolour: AppColors.mainColor,
                    iconSize: DimensionsCus.iconsize24,
                  ),
                ],
              ),
            ),
            Positioned(
              top: DimensionsCus.height20 * 5,
              left: DimensionsCus.width20,
              right: DimensionsCus.width20,
              bottom: 0,
              child: Container(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cart) {
                    var _cartlist = cart.getItems;
                    return ListView.builder(
                        itemCount: _cartlist.length,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.only(top: DimensionsCus.height15),
                            height: 100,
                            width: double.maxFinite,
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  var popularIndex = Get.find<PopularProductController>()
                                      .popularProductList
                                      .indexOf(_cartlist[index].product!);

                                  if (popularIndex >= 0) {
                                    Get.toNamed(
                                        RouteHelper.getPopularFood(popularIndex, 'cartpage'));
                                  } else {
                                    var recommendedIndex = Get.find<RecommendedProductController>()
                                        .recommendedProductList
                                        .indexOf(_cartlist[index].product!);
                                    Get.toNamed(RouteHelper.getRecommendedFood(
                                        recommendedIndex, 'cartpage'));
                                  }
                                },
                                child: Container(
                                  width: DimensionsCus.height20 * 5,
                                  height: DimensionsCus.height20 * 5,
                                  margin: EdgeInsets.only(bottom: DimensionsCus.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(AppConstants.BASE_URL +
                                              AppConstants.UploadURL +
                                              cart.getItems[index].img!),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(DimensionsCus.radius20),
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: DimensionsCus.width10,
                              ),
                              Expanded(
                                  child: Container(
                                height: DimensionsCus.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text: cart.getItems[index].name!,
                                      color: Colors.black54,
                                    ),
                                    SmallText(text: cart.getItems[index].time.toString()),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: '\$ ${cart.getItems[index].price}',
                                          color: Colors.redAccent,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cart.addItem(_cartlist[index].product!, -1);
                                                // popularproduct.setQuantity(false);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: DimensionsCus.width10,
                                            ),
                                            BigText(
                                                text: _cartlist[index]
                                                    .quantity
                                                    .toString()), // popularproduct.inCartItems.toString()),
                                            SizedBox(
                                              width: DimensionsCus.width10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cart.addItem(_cartlist[index].product!, 1);
                                                //popularproduct.setQuantity(true);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                            ]),
                          );
                        });
                  }),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartproduct) {
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
                      SizedBox(
                        width: DimensionsCus.width10,
                      ),
                      BigText(text: '\$${cartproduct.totalAmount.toStringAsFixed(2)}'),
                      SizedBox(
                        width: DimensionsCus.width10,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // popularproduct.addItem(product);
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
                      text: '\$${cartproduct.totalAmount.toStringAsFixed(2)} | Checkout',
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
