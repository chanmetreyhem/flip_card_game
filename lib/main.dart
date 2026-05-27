import 'package:flip_card_game/core/config/config.dart';
import 'package:flip_card_game/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 997),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: AppStyle.themeData(),
          initialRoute: AppPage.initPage,
          getPages: AppPage.pages,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
