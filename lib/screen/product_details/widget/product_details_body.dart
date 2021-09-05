import 'package:flutter/material.dart';
import 'package:shoppingapp/model/home_model/home_model.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsBody extends StatelessWidget {
  final PageController pageController = PageController();
  final Products products;
  ProductDetailsBody({required this.products});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              products.name!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                    color: ColorTheme.primaryColorTheme,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return Image.network(
                        products.images[index],
                      );
                    },
                    itemCount: products.images.length,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: products.images.length,
                    effect: ExpandingDotsEffect(
                      dotColor: ColorTheme.primaryColorTheme,
                      dotWidth: 10,
                      dotHeight: 10,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Description",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: ColorTheme.primaryColorTheme,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              products.description!,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
