import 'package:flutter/material.dart';
import 'package:shoppingapp/model/category_model/category_model.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

class CategoryBody extends StatelessWidget {
  final CategoryModel? categoryModel;
  CategoryBody({required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      categoryModel!.data!.categoryData[index].image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      categoryModel!.data!.categoryData[index].name!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorTheme.primaryColorTheme,
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, inedx) => SizedBox(
              height: 10,
            ),
        itemCount: categoryModel!.data!.categoryData.length);
  }
}
