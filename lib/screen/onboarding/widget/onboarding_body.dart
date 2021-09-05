import 'package:flutter/material.dart';
import 'package:shoppingapp/model/onboarding/onboarding_model.dart';
import 'package:shoppingapp/screen/login/login_screen.dart';
import 'package:shoppingapp/screen/onboarding/widget/page_view_content.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/network/local/shared_helper/shared_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  @override
  _OnBoardingBodyState createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController _controller = PageController();
  late bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: _controller,
              onPageChanged: (value) {
                if (value == onBoardingList.length - 1) {
                  setState(() {
                    isValid = true;
                  });
                }
              },
              itemBuilder: (ctx, index) {
                return PageVeiwContent(onBoardingList[index]);
              },
              itemCount: onBoardingList.length,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: onBoardingList.length,
                effect: ExpandingDotsEffect(
                  dotColor: ColorTheme.primaryColorTheme,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  if (isValid) {
                    SharedHelper.setData(key: "onBoarding", value: true)
                        .then((value) {
                      if (value) {
                        finishedPush(screen: LoginScreen(), ctx: context);
                      }
                    }).catchError((error) {
                      print(error.toString());
                    });
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                backgroundColor: ColorTheme.primaryColorTheme,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )
        ],
      ),
    );
  }
}
