import 'package:flutter/material.dart';
import 'package:flutter_news/common/entities/entitys.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/common/utils/utils.dart';
/// 推荐阅读
Widget recommendWidget(NewsItem item) {
  return Container(
    margin: EdgeInsets.all(20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //图
        imageCached(
          item.thumbnail.toString(),
          width: 335.w,
          height: 290.h,
        ),
        //作者
        Container(
          margin: EdgeInsets.only(top: 14.h),
          child: Text(
            item.author.toString(),
            style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                color: AppColors.thirdElementText,
                fontSize: 14.sp),
          ),
        ),
        //标题
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Text(
            item.title.toString(),
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: 24.sp,
                height: 1),
          ),
        ),
        //一行3列
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //分类
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  item.category.toString(),
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryElementText,
                      fontSize: 14.sp,
                      height: 1),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              //添加时间
              Container(
                width: 15.w,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  '• ${duTimeLineFormat(item.addtime)}',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: 14.sp,
                      height: 1),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              //更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: (){},
              )
            ],
          ),
        )
      ],
    ),
  );

}