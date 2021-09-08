import 'package:flutter/material.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';

class FavoriteItem extends StatelessWidget {
  final int? index;
  final ShoppingCubit? shoppingCubit;

  const FavoriteItem({required this.shoppingCubit, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                height: double.infinity,
                width: 120,
                image: NetworkImage(
                  ShoppingCubit.of(context)
                      .getFavoriteModel!
                      .data!
                      .listData[index!]
                      .product!
                      .image!,
                ),
              ),
              if (shoppingCubit!.getFavoriteModel!.data!.listData[index!]
                      .product!.discount !=
                  0)
                Container(
                  width: 70,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text(
                    "Discount",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          color: ColorTheme.whiteColorTheme,
                        ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    shoppingCubit!.getFavoriteModel!.data!.listData[index!]
                        .product!.name!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text(
                        "\$${shoppingCubit!.getFavoriteModel!.data!.listData[index!].product!.price}",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              color: ColorTheme.primaryColorTheme,
                            ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      if (shoppingCubit!.getFavoriteModel!.data!
                              .listData[index!].product!.discount !=
                          0)
                        Text(
                          "\$${shoppingCubit!.getFavoriteModel!.data!.listData[index!].product!.oldPrice}",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                    color: ColorTheme.grayColorTheme,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          shoppingCubit!.changeFavorites(
                              productId: shoppingCubit!.getFavoriteModel!.data!
                                  .listData[index!].product!.id!);
                        },
                        icon: Icon(
                          shoppingCubit!.favorite[shoppingCubit!
                                  .getFavoriteModel!
                                  .data!
                                  .listData[index!]
                                  .product!
                                  .id!]!
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: ColorTheme.primaryColorTheme,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
