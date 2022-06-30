import 'package:delivery_app/base/show_custom_snackbar.dart';
import 'package:delivery_app/controllers/auth_controller.dart';
import 'package:delivery_app/models/signup_body_model.dart';
import 'package:delivery_app/routes/routes_helper.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_text_field.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var telephoneController = TextEditingController();

    var signUpImage = ['t.png', 'f.png', 'g.png'];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String password = passwordController.text.trim();
      String email = emailController.text.trim();
      String phone = telephoneController.text.trim();

      if (name.isEmpty) {
        showCustomSnackbar('Type in your name!', title: 'Name');
      } else if (password.isEmpty) {
        showCustomSnackbar('Type in your password!', title: 'Password');
      } else if (email.isEmpty) {
        showCustomSnackbar('Type in your email!', title: 'Email');
        // } else if (GetUtils.isEmail(email)) {
        //   showCustomSnackbar('Your email is not valid', title: 'Email not valid!');
      } else if (phone.isEmpty) {
        showCustomSnackbar('Type in your phone number!', title: 'Phone number');
      } else if (password.length < 6) {
        showCustomSnackbar('Your password needs to be at least 6 characters long!',
            title: 'Password length');
      } else {
        SignUpBoody signUpBody =
            SignUpBoody(name: name, email: email, password: password, phone: phone);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (_authcontroller) {
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
                        AppTextField(
                            textEditingController: emailController,
                            hintText: 'Email',
                            iconData: Icons.email),
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
                        AppTextField(
                            textEditingController: nameController,
                            hintText: 'Name',
                            iconData: Icons.person_outline),
                        SizedBox(
                          height: DimensionsCus.height20,
                        ),
                        AppTextField(
                            textEditingController: telephoneController,
                            hintText: 'Phone',
                            iconData: Icons.phone),
                        SizedBox(
                          height: DimensionsCus.height20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _registration(_authcontroller);
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
                                text: 'Sign up',
                                size: DimensionsCus.font20 + DimensionsCus.font20 / 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DimensionsCus.height10,
                        ),
                        RichText(
                            text: TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                                text: 'Have an account already?',
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: DimensionsCus.font20))),
                        SizedBox(
                          height: DimensionsCus.screenHeight! * 0.05,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Sign up with a Social media account!',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: DimensionsCus.iconsize16,
                                ))),
                        Wrap(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: CircleAvatar(
                                      radius: DimensionsCus.radius30,
                                      backgroundImage:
                                          AssetImage('assets/image/' + signUpImage[index]),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  )
                : CustomLoader();
          },
        ));
  }
}
