import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_text_field.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var telephoneController = TextEditingController();

    var signUpImage = ['t.png', 'f.png', 'g.png'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: DimensionsCus.screenHeight! * 0.05,
            ),
            Container(
              height: DimensionsCus.screenHeight! * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage('assets/image/logo part 1.png'),
                ),
              ),
            ),
            AppTextField(
                textEditingController: emailController, hintText: 'Email', iconData: Icons.email),
            SizedBox(
              height: DimensionsCus.height20,
            ),
            AppTextField(
                textEditingController: passwordController,
                hintText: 'Password',
                iconData: Icons.password_sharp),
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
            Container(
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
            SizedBox(
              height: DimensionsCus.height10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: 'Have an account already?',
                    style: TextStyle(color: Colors.grey[500], fontSize: DimensionsCus.font20))),
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
                          backgroundImage: AssetImage('assets/image/' + signUpImage[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
