import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/screen/favorite/widget/favorite_item.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';
import 'package:shoppingapp/shared/cubit/states.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is! LoadingGetFavoriteShoppingState
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return FavoriteItem(
                    index: index,
                    shoppingCubit: ShoppingCubit.of(context),
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 5),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                },
                itemCount: ShoppingCubit.of(context)
                    .getFavoriteModel!
                    .data!
                    .listData
                    .length,
              )
            : Center(
                child: CircularProgressIndicator(
                  color: ColorTheme.primaryColorTheme,
                ),
              );
      },
    );
  }
}
