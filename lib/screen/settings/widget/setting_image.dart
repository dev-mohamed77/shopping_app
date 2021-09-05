import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/login/bloc/cubit.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

class SettingImage extends StatelessWidget {
  final LoginCubit loginCubit;

  const SettingImage({required this.loginCubit});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 210,
      // color: Colors.red,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[500]!.withOpacity(0.5),
                radius: 70,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300]!.withOpacity(0.5),
                radius: 65,
              ),
              CircleAvatar(
                backgroundImage:
                    NetworkImage(loginCubit.profileModel!.data!.image!),
                backgroundColor: ColorTheme.whiteColorTheme,
                radius: 60,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            loginCubit.profileModel!.data!.name!,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 19),
          ),
        ],
      ),
    );
  }
}
