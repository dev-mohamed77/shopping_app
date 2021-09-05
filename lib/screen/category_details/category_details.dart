import 'package:flutter/material.dart';
import 'package:shoppingapp/model/category_model/category_details_model.dart';

class CategoryDetails extends StatelessWidget {
  final CategoryDetailsData categoryDetailsData;
  CategoryDetails({required this.categoryDetailsData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 2,
          maxCrossAxisExtent: 2,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text("${categoryDetailsData.id}"),
              Text("${categoryDetailsData.name}"),
            ],
          );
        },
      ),
    );
  }
}
