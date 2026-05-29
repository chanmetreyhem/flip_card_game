import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/surprise_box/game/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:lightning_overlay/lightning_overlay.dart';

class PrizeCard extends StatefulWidget {
  final int index;
  const PrizeCard({super.key, required this.index});
  @override
  _PrizeCardState createState() => _PrizeCardState();
}

class _PrizeCardState extends State<PrizeCard> with TickerProviderStateMixin {
  late AnimationController flipAnimationController;
  late Animation<double> flipAnimation;

  late AnimationController shakeAnimationController;
  late Animation<double> shakeAnimation;
  final gameController = Get.find<SurpriseBoxGameController>();
  late ImageProvider prizeImage;

  LightningController lightningController = LightningController();

  @override
  void initState() {
    super.initState();
    flipAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    shakeAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    flipAnimation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: flipAnimationController, curve: Curves.easeInOut),
    );

    shakeAnimation = Tween<double>(begin: 1, end: 1.05).animate(
      CurvedAnimation(
        parent: shakeAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    //shakeAnimationController.repeat(reverse: true);
    //shakeAnimationController.
  }

  void _flipCard() async {
    if (!gameController.isClickable) return;
    if (flipAnimationController.isDismissed) {
      shakeAnimationController.repeat(reverse: true);
      await gameController.flipCard(widget.index);

      prizeImage = await gameController.preloadNetworkImage(
        gameController.winPrizes['image_url_win'],
      );

      shakeAnimationController.stop();

      await flipAnimationController.forward();

      await gameController.showCongratulationPopup();
    } else if (flipAnimationController.isCompleted) {
      flipAnimationController.reverse();
    }
  }



  @override
  void dispose() {
    flipAnimationController.dispose();
    shakeAnimationController.dispose();
    lightningController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: -pi, end: 0),
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
      builder: (context, t, _) {
        return Transform.rotate(
          angle: t,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 200, end: 0),
            duration: Duration(milliseconds: 1000),
            builder: (context, value, _) {
              return Transform.translate(
                offset: Offset(value, 0),
                child: GestureDetector(
                  onTap: _flipCard,
                  child: AnimatedBuilder(
                    animation: flipAnimation,
                    builder: (context, child) {
                      final angle = flipAnimation.value;
                      final isFrontVisible = angle <= pi / 2;

                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // perspective
                          ..rotateY(angle),
                        child: isFrontVisible
                            ? AnimatedBuilder(
                                animation: shakeAnimation,
                                builder: (context, child) {
                                  return ScaleTransition(
                                    scale: shakeAnimation,
                                    child: _buildFront(),
                                  );
                                },
                              )
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()..rotateY(pi),
                                child: _buildBack(),
                              ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildFront() {
    return Container(
      alignment: Alignment.center,

      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        //color: Colors.red,
        image: DecorationImage(image: AssetImage(AppAssets.board)),
      ),
      child: Lightning(
        useGesture: false,
        borderRadius: 5,
        repeatInfinity: true,
        delayDuration: const Duration(milliseconds: 300),
        controller: lightningController,
        direction: LightningDirection.leftToRight,
        pauseDuration: const Duration(milliseconds: 200),
        durationIn: const Duration(milliseconds: 300),
        durationOut: const Duration(milliseconds: 450),
        overlayColor: Colors.white.withAlpha(100),
        child: Image.asset(AppAssets.questionMarkBoard, fit: .contain),
      ),
    );
  }

  Widget _buildBack() {
    final SurpriseBoxGameController controller = Get.find();
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.board)),
      ),
      child: Obx(() {
        return Column(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: prizeImage),
                ),
              ),
            ),
            Center(
              child: Text(
                controller.winPrizes['title'] ?? 'Untitled',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      }),
    );
  }
}
