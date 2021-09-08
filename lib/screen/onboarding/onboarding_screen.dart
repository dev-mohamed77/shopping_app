import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/login/login_screen.dart';
import 'package:shoppingapp/screen/onboarding/widget/onboarding_body.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/network/local/shared_helper/shared_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColorTheme,
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColorTheme,
        elevation: 0,
        actions: [
          TextButton(
            child: Text("SKIP"),
            onPressed: () {
              SharedHelper.setData(key: "onBoarding", value: true)
                  .then((value) {
                if (value) {
                  finishedPush(screen: LoginScreen(), ctx: context);
                }
              }).catchError((error) {
                print(error.toString());
              });
            },
          )
        ],
      ),
      body: OnBoardingBody(),
    );
  }
}
