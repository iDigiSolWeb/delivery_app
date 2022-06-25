import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();
    var listCounter = 0;

    return Scaffold(
      body: Column(children: [
        Container(
          height: DimensionsCus.height10 * 12,
          padding: EdgeInsets.only(top: DimensionsCus.height55, bottom: DimensionsCus.height10),
          width: double.maxFinite,
          color: AppColors.mainColor,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            BigText(
              text: 'Cart History',
              color: Colors.white,
            ),
            AppIcon(
              icon: Icons.shopping_cart_outlined,
              iconColor: AppColors.mainColor,
              backgroundcolour: AppColors.yellowColor,
            ),
          ]),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(
                top: DimensionsCus.height20,
                left: DimensionsCus.height20,
                right: DimensionsCus.height20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: DimensionsCus.height20 * 6, // 120,
                        margin: EdgeInsets.only(bottom: DimensionsCus.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              var parsedate = DateFormat('yyyy-MM-dd HH:mm:ss')
                                  .parse(getCartHistoryList[listCounter].time!);
                              var outputformat = DateFormat('dd/MM/yyyy hh:mm a');
                              var outputdate = outputformat.format(parsedate);
                              return BigText(text: outputdate);
                            }()),
                            SizedBox(
                              height: DimensionsCus.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOrder[i], (index) {
                                      if (listCounter < getCartHistoryList.length) {
                                        listCounter++;
                                      }
                                      return index <= 2
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(right: DimensionsCus.width10 / 2),
                                              height: DimensionsCus.height20 * 4, // 80,
                                              width: DimensionsCus.height20 * 4,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                      DimensionsCus.radius15 / 2),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(AppConstants.BASE_URL +
                                                        AppConstants.UploadURL +
                                                        getCartHistoryList[listCounter - 1].img!),
                                                  )),
                                            )
                                          : Container();
                                    })),
                                Container(
                                  height: DimensionsCus.height20 * 4, // 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(
                                        text: 'Total',
                                        color: AppColors.titleColor,
                                      ),
                                      BigText(
                                        text: itemsPerOrder[i].toString() + ' Items',
                                        color: AppColors.titleColor,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: DimensionsCus.width10,
                                            vertical: DimensionsCus.width10 / 2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(DimensionsCus.radius15 / 3),
                                          border: Border.all(width: 1, color: AppColors.mainColor),
                                        ),
                                        child: SmallText(
                                          text: 'Re-order',
                                          color: AppColors.mainColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              )),
        )
      ]),
    );
  }
}
