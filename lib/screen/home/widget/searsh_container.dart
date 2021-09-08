import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/carts/carts_screen.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';

class SearchContainer extends StatelessWidget {
  final ShoppingCubit shoppingCubit;

  const SearchContainer({required this.shoppingCubit});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.notifications_active_outlined,
              size: 35,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorTheme.grayColorTheme.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: ColorTheme.grayColorTheme,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Find your product",
                      style: TextStyle(
                        fontFamily: "Quicksnad",
                        color: ColorTheme.grayColorTheme,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IconButton(
                icon: Icon(
                  Icons.card_travel_sharp,
                ),
                onPressed: () {
                  pushAndBack(screen: CartsScreen(), ctx: context);
                },
              ),
              if (shoppingCubit.getCartsModel!.data!.cartsItem.length != 0)
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                      "${shoppingCubit.getCartsModel!.data!.cartsItem.length}"),
                ),
            ],
          )
        ],
      ),
    );
  }
}
