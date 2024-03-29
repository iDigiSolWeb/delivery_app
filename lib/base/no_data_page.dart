import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  final String textToShow;
  final String imgPath;
  const NoDataPage(
      {Key? key, required this.textToShow, this.imgPath = 'assets/image/empty_cart.png'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgPath,
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.22),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          textToShow,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.0175,
              color: Theme.of(context).disabledColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
