import 'package:flutter/material.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';

class CartsItem extends StatelessWidget {
  final int index;
  final ShoppingCubit shoppingCubit;
  CartsItem({required this.shoppingCubit, required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 130,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(
                      shoppingCubit.getCartsModel!.data!.cartsItem[index]
                          .product!.image!,
                    ),
                    height: 100,
                    width: 120,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            shoppingCubit.getCartsModel!.data!.cartsItem[index]
                                .product!.name!,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 15,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            "\$${shoppingCubit.getCartsModel!.data!.cartsItem[index].product!.price}",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 15,
                                      color: ColorTheme.primaryColorTheme,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildButtonBuantity(
                                icon: Icons.remove,
                                ontap: () {},
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              buildButtonBuantity(
                                icon: Icons.add,
                                ontap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                shoppingCubit.addCarts(
                  productId: shoppingCubit
                      .getCartsModel!.data!.cartsItem[index].product!.id!,
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorTheme.whiteColorTheme,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.delete_sharp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonBuantity({
    required IconData icon,
    required void Function()? ontap,
  }) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          icon,
          color: ColorTheme.blackColorTheme,
        ),
      ),
    );
  }
}
