import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

/// 邮件订阅
Widget newsletterWidget() {
  return Container(
    margin: EdgeInsets.all(20.h),
    child: Column(
      children: <Widget>[
        // newsletter
        Row(
          children: <Widget>[
            Text(
              'Newsletter',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.h,
                fontWeight: FontWeight.w600,
                color: AppColors.thirdElement,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.thirdElementText,
                size: 17.h,
              ),
              onPressed: () {},
            ),
          ],
        ),

        // email
        inputEmailEdit(
          marginTop: 19,
          keyboardType: TextInputType.emailAddress,
          hintText: "Email",
          isPassword: false,
          controller: null,
        ),

        // btn subcrible
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: btnFlatButtonWidget(
            onPressed: () {},
            width: 335.w,
            height: 44.h,
            fontWeight: FontWeight.w600,
            title: "Subscribe",
          ),
        ),

        // disc
        Container(
          margin: EdgeInsets.only(top: 29.h),
          width: 261.w,
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'By clicking on Subscribe button you agree to accept',
              style: new TextStyle(
                color: AppColors.thirdElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 14.w,
              ),
            ),
            TextSpan(
              text: ' Privacy Policy',
              style: new TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 14.h,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  toastInfo(msg: 'Privacy Policy');
                },
            ),
          ])),
        ),
      ],
    ),
  );
}
