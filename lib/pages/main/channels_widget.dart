// 频道
import 'package:flutter/material.dart';
import 'package:flutter_news/common/entities/channels.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

Widget newsChannelsWidget({
  List<ChannelResponseEntity>? channels,
  Function(ChannelResponseEntity)? onTap,
}) {
  return Container(
    height: 137.h,
    child: channels == null
        ? Container()
        :SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: channels.map<Widget>((item) {
          return Container(
            width: 70.w,
            height: 90.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 64.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 0,
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 64.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    boxShadow: [Shadows.primaryShadow],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.h))),
                                child: Container(),
                              )),
                          Positioned(
                              child: Image.asset(
                                "assets/images/channel-${item.title}.png",
                                fit: BoxFit.none,
                              ))
                        ],
                      )),
                  Text(item.title.toString(),
                    textAlign: TextAlign.center,
                    overflow:TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                        color: AppColors.thirdElementText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        height: 1
                    ),)
                ],
              ),onTap: () => {item},),
          );
        }).toList(),
      ),
    ),
  );
}
