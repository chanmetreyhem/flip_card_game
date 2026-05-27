import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/surprise_box/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SurpriseBoxSplashView extends GetView<SurpriseBoxSplashController> {
  const SurpriseBoxSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: Get.width,
            height: Get.height,
            child: Image.asset(AppAssets.background, fit: BoxFit.cover),
          ),
          Lottie.asset(AppLotties.splash),
        ],
      ),
    );
  }
}
