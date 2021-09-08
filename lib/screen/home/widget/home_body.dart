import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/screen/home/widget/home_carouser_widget.dart';
import 'package:shoppingapp/screen/home/widget/home_product.dart';
import 'package:shoppingapp/screen/home/widget/searsh_container.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/cubit/cubit.dart';
import 'package:shoppingapp/shared/cubit/states.dart';
import 'home_category.dart';

class HomeBody extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShoppingCubit.of(context).homeModel != null &&
                ShoppingCubit.of(context).categoryModel != null
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchContainer(
                      shoppingCubit: ShoppingCubit.of(context),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CarouselHome(
                      homeModel: ShoppingCubit.of(context).homeModel,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Categories",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 25,
                              color: ColorTheme.primaryColorTheme,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: HomeCategory(
                        categoryModel: ShoppingCubit.of(context).categoryModel!,
                        // categoryDetailsModel:
                        //     ShoppingCubit.of(context).categoryDetailsModel!,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Last Product",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 25,
                              color: ColorTheme.primaryColorTheme,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HomeProduct(
                        shoppingCubit: ShoppingCubit.of(context),
                      ),
                    ),
                  ],
                ),
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
