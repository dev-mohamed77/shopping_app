import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/layout/bottom_nav_bar.dart';
import 'package:shoppingapp/screen/login/bloc/cubit.dart';
import 'package:shoppingapp/screen/login/login_screen.dart';
import 'package:shoppingapp/screen/onboarding/onboarding_screen.dart';
import 'package:shoppingapp/screen/register/bloc/cubit.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';
import 'package:shoppingapp/shared/network/local/shared_helper/shared_helper.dart';
import 'package:shoppingapp/shared/network/remote/dio_helper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  DioHelper.init();
  var sharedOnboarding = SharedHelper.getData(key: "onBoarding");
  token = SharedHelper.getData(key: "login");
  Widget widgetScreen() {
    if (sharedOnboarding != null) {
      if (token != null) {
        return BottomNavBar();
      } else {
        return LoginScreen();
      }
    }
    return OnBoardingScreen();
  }

  print(token);
  print(sharedOnboarding);

  runApp(
    ShoppingApp(
      isOnboarding: sharedOnboarding,
      widgetScreen: widgetScreen(),
    ),
  );
}

class ShoppingApp extends StatelessWidget {
  final bool? isOnboarding;
  final Widget? widgetScreen;
  ShoppingApp({required this.isOnboarding, required this.widgetScreen});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShoppingCubit()
            ..getDataHome()
            ..getCategory()
            ..getFavorite()
            ..getCarts(),
        ),
        BlocProvider(
          create: (context) => LoginCubit()..getProfile(),
        ),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorTheme.whiteColorTheme,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: ColorTheme.whiteColorTheme,
            iconTheme: IconThemeData(
              color: ColorTheme.primaryColorTheme,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: ColorTheme.primaryColorTheme,
              textStyle: TextStyle(
                color: ColorTheme.primaryColorTheme,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: "Quicksnad",
              color: ColorTheme.blackColorTheme,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(
              fontFamily: "Quicksnad",
              color: ColorTheme.grayColorTheme,
              fontSize: 18,
            ),
          ),
        ),
        home: widgetScreen,
      ),
    );
  }
}
