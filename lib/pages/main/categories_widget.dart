import 'package:flutter/material.dart';
import 'package:flutter_news/common/entities/categories.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/utils/utils.dart';

Widget newsCategoriesWidget(
    {List<CategoryResponseEntity>? categories,
    String? selCategoryCode,
    required Function(CategoryResponseEntity) onTap}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map<Widget>((item) {
              return Container(
                alignment: Alignment.center,
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  child: Text(
                    item.title!,
                    style: TextStyle(
                      color: selCategoryCode == item.code
                          ? AppColors.secondaryElementText
                          : AppColors.primaryText,
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () => onTap(item),
                ),
              );
            }).toList(),
          ),
        );
}
