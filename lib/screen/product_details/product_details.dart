import 'package:flutter/material.dart';
import 'package:shoppingapp/model/home_model/home_model.dart';
import 'package:shoppingapp/screen/product_details/widget/product_details_body.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';

class ProductDetails extends StatelessWidget {
  final PageController pageController = PageController();
  final ShoppingCubit shoppingCubit;
  final Products products;
  ProductDetails({required this.products, required this.shoppingCubit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColorTheme,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorTheme.whiteColorTheme,
            elevation: 0,
            floating: false,
            pinned: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: ProductDetailsBody(
              products: products,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "price \$${products.price}",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 23,
                    ),
              ),
              Spacer(),
              SizedBox(
                height: 45,
                width: 190,
                child: ElevatedButton(
                  onPressed: () {
                    shoppingCubit.addCarts(productId: products.id!);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Container(
                            height: 150,
                            width: 150,
                            child: shoppingCubit.addCartsModel != null
                                ? Text(
                                    "${shoppingCubit.addCartsModel!.message}")
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: ColorTheme.primaryColorTheme,
                                    ),
                                  ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Add to cart",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 25,
                          color: ColorTheme.whiteColorTheme,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme.primaryColorTheme,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
