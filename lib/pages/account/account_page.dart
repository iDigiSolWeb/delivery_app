import 'dart:typed_data';

import 'package:delivery_app/controllers/auth_controller.dart';
import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/routes/routes_helper.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/account_widget.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: DimensionsCus.height20),
        child: Column(
          children: [
            ///profile icon
            AppIcon(
              icon: Icons.person_outline,
              backgroundcolour: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: DimensionsCus.height45 + DimensionsCus.height30,
              size: DimensionsCus.height15 * 10,
            ),
            SizedBox(
              height: DimensionsCus.height30,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person_outline,
                        backgroundcolour: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: DimensionsCus.height10 * 5 / 2,
                        size: DimensionsCus.height10 * 5,
                      ),
                      bigText: BigText(
                        text: "Anton Wentzel",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: DimensionsCus.height20,
                    ),

                    ///telephone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundcolour: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: DimensionsCus.height10 * 5 / 2,
                        size: DimensionsCus.height10 * 5,
                      ),
                      bigText: BigText(
                        text: "082 495 7483",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: DimensionsCus.height20,
                    ),

                    ///email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundcolour: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: DimensionsCus.height10 * 5 / 2,
                        size: DimensionsCus.height10 * 5,
                      ),
                      bigText: BigText(
                        text: "Anton@her.co.za",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: DimensionsCus.height20,
                    ),

                    ///address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundcolour: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: DimensionsCus.height10 * 5 / 2,
                        size: DimensionsCus.height10 * 5,
                      ),
                      bigText: BigText(
                        text: "13 Vrede ave, bodorp,george",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: DimensionsCus.height20,
                    ),

                    ///message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundcolour: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: DimensionsCus.height10 * 5 / 2,
                        size: DimensionsCus.height10 * 5,
                      ),
                      bigText: BigText(
                        text: "messages",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: DimensionsCus.height20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignInPage());
                        }
                      },
                      child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundcolour: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: DimensionsCus.height10 * 5 / 2,
                          size: DimensionsCus.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Logout",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionsCus.height20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
