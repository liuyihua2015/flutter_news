import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/apis/apis.dart';
import 'package:flutter_news/common/entities/user.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();

  //密码的控制器
  final TextEditingController _passController = TextEditingController();

  //logo
  Widget _buildLogo() {
    return Container(
      width: 110.sp,
      margin: EdgeInsets.only(top: 40.sp + 44.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 76.sp,
            width: 76.sp,
            margin: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 76.sp,
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        boxShadow: [
                          Shadows.primaryShadow,
                        ],
                        borderRadius:
                            BorderRadius.all(Radius.circular((76 * 0.5).sp))),
                    child: Container(),
                  ),
                ),
                Positioned(
                    top: 13.sp,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.none,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.sp),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  height: 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.sp),
            child: Text(
              "news",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: 1),
            ),
          )
        ],
      ),
    );
  }

  //登录表单
  Widget _buildInputForm() {
    return Container(
      // width: 295.sp,
      margin: EdgeInsets.fromLTRB(40.w, 49.sp, 40.w, 0),
      child: Column(
        children: [
          //email input
          inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              marginTop: 0),
          //password input
          inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true),

          //注册、登录 横向布局
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                //注册
                btnFlatButtonWidget(
                  onPressed: () => Get.to(() => SignUpPage()),
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                btnFlatButtonWidget(
                    onPressed: _handleSignIn,
                    gbColor: AppColors.primaryElement,
                    title: "Sing in",
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: TextButton(
              onPressed: () => {},
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.h,
                  height: 1, //设置下行高，否则字体会下沉
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 执行登录操作
  _handleSignIn() async {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }

    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: _emailController.value.text,
      password: duSHA256(_passController.value.text),
    );

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    toastInfo(msg:userProfile.toString());

    // 写本地 access_token , 不写全局，业务：离线登录
    // 全局数据 gUser

    }

  //第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: [
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () => {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () => {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () => {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnFlatButtonWidget(
        onPressed: () => Get.to(() => SignUpPage()),
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignupButton(),
          ],
        ),
      ),
    ));
  }
}
