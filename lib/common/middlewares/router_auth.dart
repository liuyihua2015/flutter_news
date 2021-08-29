import 'package:flutter/material.dart';
import 'package:flutter_news/common/routes/app_pages.dart';
import 'package:flutter_news/global.dart';
import 'package:get/get.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Global.profile.accessToken != null ||
        route == AppRoutes.SignInPage ||
        route == AppRoutes.SignUpPage ||
        route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return RouteSettings(name: AppRoutes.SignInPage);
    }
  }
}
