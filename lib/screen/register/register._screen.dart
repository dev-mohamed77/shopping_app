import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/register/widget/register_body.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColorTheme,
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColorTheme,
        elevation: 0,
      ),
      body: RegisterBody(),
    );
  }
}
