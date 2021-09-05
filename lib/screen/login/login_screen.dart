import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/login/widget/login_body.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColorTheme,
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColorTheme,
        elevation: 0,
      ),
      body: LoginBody(),
    );
  }
}
