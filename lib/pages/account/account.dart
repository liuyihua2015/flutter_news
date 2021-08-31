import 'package:flutter/material.dart';
import 'package:flutter_news/common/provider/provider.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // 个人页面 头部
  Widget _buildUserHeader() {
    return Container(
      height: 333.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 333.h,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: AppColors.tabCellSeparator,
                    ),
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            right: 20,
            bottom: 21,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 头像
                Container(
                  height: 198.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 108.w,
                          height: 108.w,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: 108.w,
                                  height: 108.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    boxShadow: [
                                      Shadows.primaryShadow,
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(108) / 2)),
                                  ),
                                ),
                              Positioned(
                                top: 6,
                                child: Image.asset(
                                  "assets/images/account_header.png",
                                  height: 88.h,
                                  width: 88.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 文字
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 9),
                        child: Text(
                          Global.profile.displayName!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Text(
                        "@boltrogers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // 按钮
                Spacer(),
                Container(
                  height: 44,
                  child: FlatButton(
                    onPressed: () => {},
                    color: Color.fromARGB(255, 41, 103, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    textColor: Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Get Premium - \$9.99",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryElementText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 列表项
  Widget _buildCell({
    String? title,
    String? subTitle,
    int? number,
    bool? hasArrow = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // 背景
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: AppColors.tabCellSeparator,
                      ),
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            // 右侧
            Positioned(
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // 数字
                  number == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(right: 11),
                          child: Text(
                            number.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                  // 箭头
                  hasArrow == false
                      ? Container()
                      : Container(
                          width: 24.h,
                          height: 24.h,
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primaryText,
                          ),
                        ),
                ],
              ),
            ),

            // 标题
            title == null
                ? Container()
                : Positioned(
                    left: 20,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),

            // 子标题
            subTitle == null
                ? Container()
                : Positioned(
                    right: 20,
                    child: Text(
                      subTitle,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildUserHeader(),
          divider10Px(),
          _buildCell(
            title: "Email",
            subTitle: "boltrogers@gmail.com",
          ),
          divider10Px(),
          _buildCell(
            title: "Favorite channels",
            number: 12,
            hasArrow: true,
          ),
          _buildCell(
            title: "Bookmarks",
            number: 294,
            hasArrow: true,
          ),
          _buildCell(
            title: "Popular categories",
            number: 7,
            hasArrow: true,
          ),
          divider10Px(),
          _buildCell(
            title: "Newsletter",
            hasArrow: true,
          ),
          _buildCell(
            title: "Settings",
            hasArrow: true,
          ),
          divider10Px(),
          _buildCell(
            title: "Switch Gray Filter",
            hasArrow: true,
            onTap: () => appState.switchGrayFilter(),
          ),
          _buildCell(
            title: "Log out",
            subTitle: Global.profile.displayName.toString(),
            hasArrow: false,
            // onTap: () => goLoginPage(context),
            onTap: () => goLoginPage(),
          ),
          divider10Px(),
        ],
      ),
    );
  }
}
