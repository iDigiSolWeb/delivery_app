import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_column.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/icon_and_text_widget.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  final double _height = DimensionsCus.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: DimensionsCus.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(
                  position,
                );
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: DimensionsCus.height30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: DimensionsCus.width30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: DimensionsCus.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: DimensionsCus.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: 'Food pairing',
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: DimensionsCus.width20, right: DimensionsCus.width20, bottom: DimensionsCus.height10),
                child: Row(
                  children: [
                    Container(
                      width: DimensionsCus.listviewImgSize, // 120,
                      height: DimensionsCus.listviewImgSize, // 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(DimensionsCus.radius20),
                          color: Colors.white38,
                          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/image/food0.png'))),
                    ),
                    Expanded(
                      child: Container(
                        height: DimensionsCus.listviewTextContSize, //100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(DimensionsCus.radius20),
                              bottomRight: Radius.circular(DimensionsCus.radius20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: DimensionsCus.width10, right: DimensionsCus.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: 'Nutritious fruit meal in China'),
                              SizedBox(
                                height: DimensionsCus.height10,
                              ),
                              SmallText(text: 'With Chinese characteristics'),
                              SizedBox(
                                height: DimensionsCus.height10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp, text: 'Normal', iconColor: AppColors.iconColor1),
                                  SizedBox(
                                    width: DimensionsCus.height20,
                                  ),
                                  IconAndTextWidget(
                                      icon: Icons.location_on, text: '1.7km', iconColor: AppColors.mainColor),
                                  SizedBox(
                                    width: DimensionsCus.height20,
                                  ),
                                  IconAndTextWidget(
                                      icon: Icons.access_time_outlined, text: '32min', iconColor: AppColors.iconColor2),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      ///current slide
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      ///next slide
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      ///previous slide
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      ///all other slides that become visible after swipe
      var currScale = .8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: DimensionsCus.pageViewContainer,
            margin: EdgeInsets.only(left: DimensionsCus.width10, right: DimensionsCus.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionsCus.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.png'),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: DimensionsCus.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: DimensionsCus.width30, right: DimensionsCus.width30, bottom: DimensionsCus.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionsCus.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    //blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    //blurRadius: 5.0,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: DimensionsCus.width15, left: DimensionsCus.width15, right: DimensionsCus.width15),
                child: AppColum(text: 'Chinese Side'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
