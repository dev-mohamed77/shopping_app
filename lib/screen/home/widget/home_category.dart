import 'package:flutter/material.dart';
import 'package:shoppingapp/model/category_model/category_model.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

class HomeCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  // final CategoryDetailsModel categoryDetailsModel;
  HomeCategory({
    required this.categoryModel,
    // required this.categoryDetailsModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          // color: Colors.red,
          ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // pushAndBack(
              //     screen: CategoryDetails(
              //       categoryDetailsData:
              //           categoryDetailsModel.data!.listData[index],
              //     ),
              //     ctx: context,);
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: ColorTheme.whiteColorTheme,
                  backgroundImage: NetworkImage(
                    categoryModel.data!.categoryData[index].image!,
                  ),
                ),
                Text(
                  categoryModel.data!.categoryData[index].name!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemCount: categoryModel.data!.categoryData.length,
      ),
    );
  }
}
