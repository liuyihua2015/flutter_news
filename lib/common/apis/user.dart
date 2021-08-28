import 'package:flutter_news/common/entities/user.dart';
import 'package:flutter_news/common/utils/http.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login({
    UserLoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      "/user/login",
      data: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}

/// 用户
// class UserAPI {
//   /// 登录
//   static Future<UserLoginResponseEntity> login({
//     UserLoginRequestEntity? params,
//   }) async {
//     var response = await HttpUtil().post(
//       '/user/login',
//       data: params?.toJson(),
//     );
//     return UserLoginResponseEntity.fromJson(response);
//   }
//
//   /// 注册
//   static Future<UserRegisterRequestEntity> register({
//     UserRegisterRequestEntity? params,
//   }) async {
//     var response = await HttpUtil().post(
//       '/user/register',
//       data: params?.toJson(),
//     );
//     return UserRegisterRequestEntity.fromJson(response);
//   }
// }