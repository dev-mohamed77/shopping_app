import 'package:flutter/material.dart';
import 'package:shoppingapp/model/home_model/home_model.dart';
import 'package:shoppingapp/screen/product_details/product_details.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';

class HomeProduct extends StatelessWidget {
  final ShoppingCubit shoppingCubit;

  HomeProduct({
    required this.shoppingCubit,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1.51,
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        children: shoppingCubit.homeModel!.data!.products.map((item) {
          return buildWidgetProduct(item, context);
        }).toList(),
      ),
    );
  }

  Widget buildWidgetProduct(Products item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushAndBack(
          screen: ProductDetails(
            shoppingCubit: shoppingCubit,
            products: item,
          ),
          ctx: context,
        );
      },
      child: Container(
        color: ColorTheme.whiteColorTheme,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  item.image!,
                  // fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
                if (item.discount != 0)
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorTheme.primaryColorTheme,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      "Discount",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: ColorTheme.whiteColorTheme,
                          ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  item.name!,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    Text(
                      "\$${item.price}",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                            // color: ColorTheme.primaryColorTheme,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (item.discount != 0)
                      Text(
                        "\$${item.oldPrice}",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        shoppingCubit.favorite[item.id]!
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 25,
                        color: ColorTheme.primaryColorTheme,
                      ),
                      onPressed: () =>
                          shoppingCubit.changeFavorites(productId: item.id!),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
