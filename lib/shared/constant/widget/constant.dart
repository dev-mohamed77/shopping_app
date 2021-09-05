import 'package:flutter/material.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

String? token = "";

void finishedPush({
  required dynamic screen,
  required BuildContext ctx,
}) {
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(
      builder: (ctx) => screen,
    ),
  );
}

void pushAndBack({
  required dynamic screen,
  required BuildContext ctx,
}) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (ctx) => screen,
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController control,
  required TextInputType keyType,
  required String textTitle,
  required String? Function(String?) validator,
  Function(String)? onchange,
  void Function()? onpressed,
  IconData? icon,
  bool isPass = false,
  bool isShowPassword = false,
}) {
  return TextFormField(
    controller: control,
    keyboardType: keyType,
    validator: validator,
    onChanged: onchange,
    obscureText: isShowPassword,
    decoration: InputDecoration(
      hintText: textTitle,
      filled: true,
      fillColor: ColorTheme.grayColorTheme.withOpacity(0.15),
      suffixIcon: isPass
          ? IconButton(
              icon: Icon(isPass ? icon : null),
              onPressed: onpressed,
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorTheme.primaryColorTheme,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorTheme.primaryColorTheme,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorTheme.grayColorTheme.withOpacity(0.1),
          width: 2,
        ),
      ),
    ),
  );
}
