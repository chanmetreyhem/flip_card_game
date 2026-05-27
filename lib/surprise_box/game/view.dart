import 'dart:math';

import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/surprise_box/game/controller.dart';
import 'package:flip_card_game/surprise_box/game/widgets/prize_box.dart';
import 'package:flip_card_game/surprise_box/game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurpriseBoxGameView extends GetView<SurpriseBoxGameController> {
  const SurpriseBoxGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            GameView(),

            // congratulation pop up
            Obx(() {
              return Visibility(
                visible: controller.isCongratulation,
                child: CongratulationPopup(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
