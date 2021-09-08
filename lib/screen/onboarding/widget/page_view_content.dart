import 'package:flutter/material.dart';
import 'package:shoppingapp/model/onboarding/onboarding_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageVeiwContent extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  PageVeiwContent(this.onBoardingModel);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SvgPicture.asset(onBoardingModel.images),
        ),
        Text(
          onBoardingModel.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          onBoardingModel.subTitle,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
