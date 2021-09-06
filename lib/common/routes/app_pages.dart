import 'package:flutter_news/common/middlewares/middlewares.dart';
import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/details/details.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';
import 'package:flutter_news/pages/welcome/welcomePage.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static final routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SignInPage,
      page: () => SignInPage(),
    ),
    GetPage(
      name: AppRoutes.SignUpPage,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => Application(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Details,
      page: () => DetailsPage(),
    )
  ];
}
