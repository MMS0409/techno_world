import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/category/category_model.dart';


class CategoryItemView extends StatelessWidget {
  const CategoryItemView({super.key, required this.categoryModel, required this.onTap, required this.selectedId});

  final CategoryModel categoryModel;
  final VoidCallback onTap;
  final String selectedId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(7),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: selectedId ==
              categoryModel.categoryId
              ? Colors.black
              : Colors.white,
        ),
        child: Column(
          children: [
            Container(

              height: 50.h,
              width: 60.w,

              child: Center(
                child: CachedNetworkImage(
                imageUrl: categoryModel.imageUrl,
                ),
              )

            ),
            SizedBox(height: 5.h,),
            Text(categoryModel.categoryName,style: TextStyle(
              color: selectedId ==
                  categoryModel.categoryId
                  ? Colors.white
                  : Colors.black,
            ),)

          ],
        ),
      ),
    );
  }
}
