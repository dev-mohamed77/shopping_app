import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';
import 'package:shoppingapp/shared/cubit/states.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ShoppingCubit.of(context)
              .navBarPages[ShoppingCubit.of(context).navBarCount],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontFamily: "Quicksnad",
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: "Quicksnad",
            ),
            unselectedItemColor: ColorTheme.grayColorTheme,
            selectedItemColor: ColorTheme.primaryColorTheme,
            items: ShoppingCubit.of(context).bottomNavBarItem,
            currentIndex: ShoppingCubit.of(context).navBarCount,
            onTap: (index) => ShoppingCubit.of(context).navBarChangeItem(index),
          ),
        );
      },
    );
  }
}
