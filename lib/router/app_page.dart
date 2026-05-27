import 'package:flip_card_game/router/app_route.dart';
import 'package:flip_card_game/surprise_box/game/game.dart';
import 'package:flip_card_game/surprise_box/share/share.dart';
import 'package:flip_card_game/surprise_box/splash/splash.dart';

import 'package:get/get.dart';

class AppPage {
  static String initPage = AppRoute.splash;
  static final pages = [
    GetPage(
      name: AppRoute.splash,
      page: () => SurpriseBoxSplashView(),
      binding: SurpriseBoxSplashBinding(),
    ),
    GetPage(
      name: AppRoute.game,
      page: () => SurpriseBoxGameView(),
      binding: SurpriseBoxGameBinding(),
    ),
    GetPage(
      name: AppRoute.share,
      page: () => SharePrizeView(),
      binding: SharePrizeBinding(),
    ),
  ];
}
