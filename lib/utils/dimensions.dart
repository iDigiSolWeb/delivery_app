import 'package:get/get.dart';

///screensize/scalefactor e.g 844(Screensize) / 20(Item/fontsize) = scalefactor

class DimensionsCus {
  static double? screenHeight = Get.height;
  static double? screenWidth = Get.width;

  static double pageViewContainer = screenHeight! / 3.84;
  static double pageViewTextContainer = screenHeight! / 7.03;
  static double pageView = screenHeight! / 2.64;

  static double height10 = screenHeight! / 84.4;
  static double height15 = screenHeight! / 56.27;
  static double height20 = screenHeight! / 42.4;
  static double height30 = screenHeight! / 28.13;
  static double height45 = screenHeight! / 18.76;
  static double height55 = screenHeight! / 15.35;

  static double font20 = screenHeight! / 42.2;
  static double font26 = screenHeight! / 32.46;

  static double radius12 = screenHeight! / 70.33;
  static double radius15 = screenHeight! / 56.27;
  static double radius20 = screenHeight! / 42.2;
  static double radius30 = screenHeight! / 28.13;

  static double width10 = screenHeight! / 84.4;
  static double width15 = screenHeight! / 56.27;
  static double width20 = screenHeight! / 42.4;
  static double width30 = screenHeight! / 28.13;
  static double width45 = screenHeight! / 18.76;

  static double iconsize24 = screenHeight! / 35.17;
  static double iconsize16 = screenHeight! / 52.75;

  static double listviewImgSize = screenHeight! / 7.03;
  static double listviewTextContSize = screenHeight! / 8.44;

  static double popularFoodImgSize = screenHeight! / 2.41;

  static double bottomHeight = screenHeight! / 7.03;
}
