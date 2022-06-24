import 'package:delivery_app/pages/food/popular_food_detail.dart';
import 'package:delivery_app/pages/food/recommended_food_detail.dart';
import 'package:delivery_app/pages/home/home_page.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:delivery_app/pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-Food';
  static const String recommendedFood = '/recommended-Food';
  static const String cartpage = '/cart-page';
  static const String splashScreen = '/splash-screen';

  ///use if passing parameters
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartpage';
  static String getSplashScreen() => '$splashScreen';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: cartpage, page: () => CartPage(), transition: Transition.fadeIn),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
  ];
}
