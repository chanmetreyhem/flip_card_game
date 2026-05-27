import 'dart:math';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card_game/surprise_box/game/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../assets.dart';

class BigPrizeBox extends StatefulWidget {
  const BigPrizeBox({super.key});

  @override
  State<BigPrizeBox> createState() => _BigPrizeBoxState();
}

class _BigPrizeBoxState extends State<BigPrizeBox>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Timer timer;

  int currentIndex = 0;
  int get nextIndex => (currentIndex + 1) % gameController.bigPrizes.length;

  final SurpriseBoxGameController gameController = Get.find();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _triggerFlip();
    });
  }

  void _triggerFlip() {
    if (animationController.isDismissed) {
      animationController.forward().then((_) {
        setState(() {
          currentIndex = nextIndex; // Updates state reactively
        });
      });
      ;
    } else if (animationController.isCompleted) {
      animationController.reverse().then((_) {
        setState(() {
          currentIndex = nextIndex; // Updates state reactively
        });
      });
      ;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bigPrizeImageTransform = CachedNetworkImage(
      placeholder: (context, url) =>
          Image.asset(AppAssets.coinGroup, fit: .contain),
      imageUrl: gameController.bigPrizes[currentIndex],
    );
    return Container(
      width: 180,
      height: 180,

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.circleFrame)),
      ),
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.light)),
        ),
        child: Transform.flip(
          flipY: true,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final angle = animation.value;
              final isFrontVisible = angle <= pi / 2;

              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0008)
                  ..rotateY(angle),

                alignment: Alignment.center,

                child: Transform(
                  transform: Matrix4.identity()..rotateX(pi),
                  alignment: Alignment.center,
                  child: isFrontVisible
                      ? bigPrizeImageTransform
                      : bigPrizeImageTransform,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
