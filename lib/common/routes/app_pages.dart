import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';
import 'package:flutter_news/pages/welcome/welcomePage.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.WelcomePage;

  static final routes = [
    GetPage(
        name: AppRoutes.WelcomePage,
        page: () => WelcomePage(),
        children: [
          GetPage(
            name: AppRoutes.SignInPage,
            page: () => SignInPage(),
          children: [
            GetPage(
              name: AppRoutes.SignUpPage,
              page: () => SignUpPage(),)
          ])
        ]
    ),
  ];
}