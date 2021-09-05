import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/model/home_model/home_model.dart';

class CarouselHome extends StatelessWidget {
  final HomeModel? homeModel;

  CarouselHome({required this.homeModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: CarouselSlider.builder(
        carouselController: CarouselController(),
        itemCount: homeModel!.data!.banners.length,
        itemBuilder: (context, index, i) {
          return Container(
            child: Image.network(
              homeModel!.data!.banners[index].image!,
              fit: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          viewportFraction: 1,
          disableCenter: true,
          autoPlay: true,
        ),
      ),
    );
  }
}
