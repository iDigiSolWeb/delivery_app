import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textheight = DimensionsCus.screenHeight! / 5.63;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textheight) {
      firstHalf = widget.text.substring(0, textheight.toInt());
      secondHalf = widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                  text: hiddenText ? (firstHalf + '...') : (firstHalf + secondHalf),
                  size: DimensionsCus.iconsize16,
                  color: AppColors.paraColor,
                  height: 1.6,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: 'Show more',
                        color: AppColors.mainColor,
                        size: DimensionsCus.iconsize16, // 16,
                      ),
                      Icon(
                        hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
