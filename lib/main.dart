import 'package:flutter/material.dart';
import 'package:flutter_news/common/provider/app.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'common/routes/app_pages.dart';
import 'global.dart';

void main() => Global.init().then((e) => runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<AppState>.value(
              value: Global.appState,
            ),
          ],
          child: Consumer<AppState>(
            builder: (content, appState, _) {
              if (appState.isGrayFilter) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                  child: MyApp(),
                );
              } else {
                return MyApp();
              }
            },
          )),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: () => GetMaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
