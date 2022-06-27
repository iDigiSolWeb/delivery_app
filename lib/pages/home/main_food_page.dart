import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _loadResources,
      child: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: DimensionsCus.height55, bottom: DimensionsCus.height15),
              padding: EdgeInsets.only(left: DimensionsCus.width20, right: DimensionsCus.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'South Africa',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'George',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: DimensionsCus.width45, // 45,
                      height: DimensionsCus.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(DimensionsCus.radius12),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: DimensionsCus.iconsize24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    ));
  }
}
