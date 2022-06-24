import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/controllers/recommended_product_controller.dart';
import 'package:delivery_app/pages/cart/cart_page.dart';
import 'package:delivery_app/pages/food/popular_food_detail.dart';
import 'package:delivery_app/pages/food/recommended_food_detail.dart';
import 'package:delivery_app/pages/home/food_page_body.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Best Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
