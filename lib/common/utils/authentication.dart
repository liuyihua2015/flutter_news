import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/common/entities/entitys.dart';
import 'package:flutter_news/common/routes/app_pages.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/global.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存 token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile =  UserLoginResponseEntity(
    accessToken: null,
  );
}

/// 重新登录
Future goLoginPage() async {
  await deleteAuthentication();
  Get.offAllNamed(AppRoutes.SignInPage);
  // ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
  //     Routes.signInPageRoute, (Route<dynamic> route) => false);
}
