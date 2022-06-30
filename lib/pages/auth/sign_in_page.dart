import 'package:delivery_app/base/custom_loader.dart';
import 'package:delivery_app/pages/auth/sign_up_page.dart';
import 'package:delivery_app/routes/routes_helper.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_text_field.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../models/signup_body_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    void _login(AuthController authController) {
      String password = passwordController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();

      if (password.isEmpty) {
        showCustomSnackbar('Type in your password!', title: 'Password');
      } else if (email.isEmpty) {
        showCustomSnackbar('Type in your email!', title: 'Email');
        // } else if (GetUtils.isEmail(email)) {
        //   showCustomSnackbar('Your email is not valid', title: 'Email not valid!');
      } else if (password.length < 6) {
        showCustomSnackbar('Your password needs to be at least 6 characters long!',
            title: 'Password length');
      } else {
        authController.login(email, password, phone).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getCartPage());
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authcontroller) {
          return _authcontroller.isLoading == false
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: DimensionsCus.screenHeight! * 0.05,
                      ),
                      Container(
                        height: DimensionsCus.screenHeight! * 0.25,
                        child: const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage: AssetImage('assets/image/logo part 1.png'),
                          ),
                        ),
                      ),
                      Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: DimensionsCus.width20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hello',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: DimensionsCus.font20 * 3 + DimensionsCus.height20 / 2,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('Sign into your account',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: DimensionsCus.font20, color: Colors.grey[500])),
                            ],
                          )),
                      SizedBox(
                        height: DimensionsCus.height20,
                      ),
                      AppTextField(
                          textEditingController: emailController,
                          hintText: 'Email',
                          iconData: Icons.email),
                      SizedBox(
                        height: DimensionsCus.height20,
                      ),
                      AppTextField(
                          textEditingController: phoneController,
                          hintText: 'Phone',
                          iconData: Icons.phone),
                      SizedBox(
                        height: DimensionsCus.height20,
                      ),
                      AppTextField(
                          textEditingController: passwordController,
                          hintText: 'Password',
                          iconData: Icons.password_sharp,
                          obscuretext: true),
                      SizedBox(
                        height: DimensionsCus.height20,
                      ),
                      RichText(
                          text: TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                              text: 'Sign into your account!',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: DimensionsCus.font20))),
                      SizedBox(
                        height: DimensionsCus.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _login(_authcontroller);
                        },
                        child: Container(
                          width: DimensionsCus.screenWidth! / 2,
                          height: DimensionsCus.screenHeight! / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(DimensionsCus.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: 'Sign in',
                              size: DimensionsCus.font20 + DimensionsCus.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DimensionsCus.height45,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: DimensionsCus.font20,
                            ),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => Get.to(SignUpPage(), transition: Transition.fade),
                                  text: ' Create one now!',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: DimensionsCus.font20,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
