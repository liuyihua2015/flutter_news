import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // fullName email password 的控制器
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Text(
        "Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Montserrat",
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            height: 1),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      // width: 295.sp,
      margin: EdgeInsets.fromLTRB(40.w, 49.sp, 40.w, 0),
      child: Column(
        children: [
          //Full name input
          inputTextEdit(
              controller: _fullnameController,
              keyboardType: TextInputType.text,
              hintText: "Full name",
              marginTop: 0),
          //email input
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
          ),
          //password input
          inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true),

          //注册、登录 横向布局
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 15.sp),
            child: (btnFlatButtonWidget(
              onPressed: () {
                if (!duCheckStringLength(_fullnameController.value.text, 5)) {
                  toastInfo(msg: '用户名不能小于5位');
                  return;
                }
                if (!duIsEmail(_emailController.value.text)) {
                  toastInfo(msg: '请正确输入邮件');
                  return;
                }
                if (!duCheckStringLength(_passController.value.text, 6)) {
                  toastInfo(msg: '密码不能小于6位');
                  return;
                }
                Get.back();
              },
              gbColor: AppColors.primaryElement,
              title: "Create an account",
              width: 1.sw,
              fontWeight: FontWeight.w600,
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40.w, 20.h, 40.w, 0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.h,
                    height: 1.5, //设置下行高，否则字体会下沉
                  ),
                  children: <InlineSpan>[
                    TextSpan(text: 'By signing up you agree to our'),
                    TextSpan(
                      text: ' Terms ',
                      style: TextStyle(
                        color: AppColors.secondaryElementText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.h,
                        height: 1.5, //设置下行高，否则字体会下沉
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          toastInfo(msg: 'Terms');
                        },
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Conditions of Use',
                      style: TextStyle(
                        color: AppColors.secondaryElementText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.h,
                        height: 1.5, //设置下行高，否则字体会下沉
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          toastInfo(msg: 'Conditions of Use');
                        },
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
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
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnFlatButtonWidget(
        onPressed: () => Get.back(),
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () => Get.back(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
