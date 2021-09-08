import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/screen/carts/widget/carts_item.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';
import 'package:shoppingapp/shared/cubit/states.dart';

class CartsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
      listener: (context, stata) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorTheme.whiteColorTheme,
          appBar: AppBar(
            backgroundColor: ColorTheme.whiteColorTheme,
            elevation: 0,
          ),
          body: ShoppingCubit.of(context).getCartsModel != null
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return CartsItem(
                      index: index,
                      shoppingCubit: ShoppingCubit.of(context),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: ShoppingCubit.of(context)
                      .getCartsModel!
                      .data!
                      .cartsItem
                      .length,
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: ColorTheme.primaryColorTheme,
                  ),
                ),
          bottomNavigationBar: Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20, left: 18, right: 18),
            decoration: BoxDecoration(
              color: ColorTheme.whiteColorTheme,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ColorTheme.grayColorTheme,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${ShoppingCubit.of(context).getCartsModel!.data!.total}",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total Price",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              color: ColorTheme.grayColorTheme,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Buy Now!"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme.primaryColorTheme,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
