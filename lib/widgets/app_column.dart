import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColum extends StatelessWidget {
  final String text;
  const AppColum({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: DimensionsCus.font26,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '12387'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp, text: 'Normal', iconColor: AppColors.iconColor1),
            SizedBox(
              width: DimensionsCus.height20,
            ),
            IconAndTextWidget(icon: Icons.location_on, text: '1.7km', iconColor: AppColors.mainColor),
            SizedBox(
              width: DimensionsCus.height20,
            ),
            IconAndTextWidget(icon: Icons.access_time_outlined, text: '32min', iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
