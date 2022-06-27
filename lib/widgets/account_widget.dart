import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key, required this.appIcon, required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: DimensionsCus.width20, top: DimensionsCus.width10, bottom: DimensionsCus.height15),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: DimensionsCus.width20,
          ),
          bigText,
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(
              0.2,
            ))
      ]),
    );
  }
}
