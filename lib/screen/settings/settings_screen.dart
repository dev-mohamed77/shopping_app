import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/screen/about%20us/about_Screen.dart';
import 'package:shoppingapp/screen/contact%20us/contact_screen.dart';
import 'package:shoppingapp/screen/login/bloc/cubit.dart';
import 'package:shoppingapp/screen/login/bloc/states.dart';
import 'package:shoppingapp/screen/login/login_screen.dart';
import 'package:shoppingapp/screen/privacy/privacy_screen.dart';
import 'package:shoppingapp/screen/profile/profile_screen.dart';
import 'package:shoppingapp/screen/settings/widget/setting_image.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/network/local/shared_helper/shared_helper.dart';

class SettingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> title = [
    {
      "title": "Account",
      "icon": Icons.person,
    },
    {
      "title": "Dark Mode",
      "icon": Icons.dark_mode,
    },
    {
      "title": "Privacy",
      "icon": Icons.privacy_tip,
    },
    {
      "title": "Contact us",
      "icon": Icons.contact_page,
    },
    {
      "title": "About us",
      "icon": Icons.ac_unit,
    },
  ];

  void buildOnTap(BuildContext ctx, Map<String, dynamic> item) {
    if (item["title"] == "Account") {
      return pushAndBack(
          screen: ProfileScreen(
            loginCubit: LoginCubit.of(ctx),
          ),
          ctx: ctx);
    } else if (item["title"] == "Dark Mode") {
      AlertDialog alertDialog = AlertDialog(
        title: Text("Select Mode"),
        content: SwitchListTile(
          value: true,
          onChanged: (value) {},
          title: Text("Select Mode"),
        ),
      );
      showDialog(
        context: ctx,
        builder: (context) {
          return alertDialog;
        },
      );
    } else if (item["title"] == "Privacy") {
      pushAndBack(screen: PrivacyScreen(), ctx: ctx);
    } else if (item["title"] == "Contact us") {
      pushAndBack(screen: ContactScreen(), ctx: ctx);
    } else if (item["title"] == "About us") {
      pushAndBack(screen: AboutScreen(), ctx: ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return LoginCubit.of(context).profileModel != null
            ? Scaffold(
                backgroundColor: ColorTheme.whiteColorTheme,
                appBar: AppBar(
                  backgroundColor: ColorTheme.whiteColorTheme,
                  elevation: 0,
                  title: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SettingImage(
                        loginCubit: LoginCubit.of(context),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: title.map((item) {
                            return buildListTile(context, item);
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            SharedHelper.removeData(key: "login").then((value) {
                              if (value) {
                                finishedPush(
                                    screen: LoginScreen(), ctx: context);
                              }
                            }).catchError((error) {
                              print(error);
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: ColorTheme.whiteColorTheme,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Logout",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: ColorTheme.whiteColorTheme,
                                      fontSize: 20,
                                    ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: ColorTheme.primaryColorTheme,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                color: ColorTheme.primaryColorTheme,
              ));
      },
    );
  }

  Widget buildListTile(BuildContext context, Map<String, dynamic> item) {
    return ListTile(
      onTap: () => buildOnTap(context, item),
      leading: Icon(
        item["icon"],
        color: ColorTheme.primaryColorTheme,
        size: 20,
      ),
      title: Text(
        item["title"],
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorTheme.grayColorTheme,
      ),
    );
  }
}
