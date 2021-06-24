import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({key}) : super(key: key);

  /// 页头标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: 65.w2),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp2),
      ),
    );
  }

  /// 页头说明
  Widget _buildPageHeaderDetail() {
    return Container(
      width: 242.w2,
      height: 70.h2,
      margin: EdgeInsets.only(top: (14.h2)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: 16.sp2,
          height: 1.3,
        ),
      ),
    );
  }

  /// 特性说明
  /// 宽度 80 + 20 + 195 = 295
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: 295.w2,
      height: 80.h2,
      margin: EdgeInsets.only(top: marginTop.h2),
      child: Row(
        children: [
          Container(
            width: 80.w2,
            height: 80.w2,
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: 195.w2,
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 16.sp2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: 295.w2,
      height: 44.h2,
      margin: EdgeInsets.only(
        bottom: 20.h2,
      ),
      // child: FlatButton(
      //   color: AppColors.primaryElement,
      //   textColor: AppColors.primaryElementText,
      //   child: Text("Get started"),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(6.r2)),
      //   ),
      //   onPressed: () {},
      // ),
      child: TextButton(
          //定义一下文本样式
          style: ButtonStyle(
            //定义文本的样式 这里设置的颜色是不起作用的
            textStyle: MaterialStateProperty.all(TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 15.sp2)),
            //设置按钮上字体与图标的颜色
            foregroundColor:
                MaterialStateProperty.all(AppColors.primaryElementText),

            //更优美的方式来设置
            // foregroundColor: MaterialStateProperty.resolveWith(
            //   (states) {
            //     if (states.contains(MaterialState.focused) &&
            //         !states.contains(MaterialState.pressed)) {
            //       //获取焦点时的颜色
            //       return Colors.blue;
            //     } else if (states.contains(MaterialState.pressed)) {
            //       //按下时的颜色
            //       return Colors.red;
            //     }
            //     //默认状态使用灰色
            //     return Colors.grey;
            //   },
            // ),

            //背景颜色
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              //设置按下时的背景颜色
              if (states.contains(MaterialState.pressed)) {
                return AppColors.primaryElement;
              }
              //默认不使用背景颜色
              return AppColors.primaryElement;
            }),
            //设置水波纹颜色
            // overlayColor: MaterialStateProperty.all(Colors.yellow),
            //设置阴影  不适用于这里的TextButton
            // elevation: MaterialStateProperty.all(10),
            //设置按钮内边距
            // padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            //设置按钮的大小
            // minimumSize: MaterialStateProperty.all(Size(200, 100)),

            //设置边框
            // side:
            // MaterialStateProperty.all(BorderSide(color: Colors.yellow, width: 1)),
            //外边框装饰 会覆盖 side 配置的样式
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r2))),
          ),
          child: Text("Get started"),
          //添加一个点击事件
          onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 高度去掉 顶部、底部 导航
    // ScreenUtil.init(context,
    //     width: 375, height: 812 - 44 - 34, allowFontScaling: true);

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 812),
        orientation: Orientation.portrait);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 44, bottom: 34),
        child: Center(
          child: Column(
            children: <Widget>[
              _buildPageHeadTitle(),
              _buildPageHeaderDetail(),
              _buildFeatureItem(
                "feature-1",
                "Compelling photography and typography provide a beautiful reading",
                86,
              ),
              _buildFeatureItem(
                "feature-2",
                "Sector news never shares your personal data with advertisers or publishers",
                40,
              ),
              _buildFeatureItem(
                "feature-3",
                "You can get Premium to unlock hundreds of publications",
                40,
              ),
              Spacer(),
              _buildStartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
