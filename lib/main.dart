import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'common/routes/app_pages.dart';
import 'global.dart';
import 'pages/welcome/welcomePage.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
