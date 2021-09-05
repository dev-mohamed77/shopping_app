import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/home/widget/home_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
