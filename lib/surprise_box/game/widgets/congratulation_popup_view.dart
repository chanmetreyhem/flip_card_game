import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/core/config/config.dart';
import 'package:flip_card_game/router/app_route.dart';
import 'package:flip_card_game/surprise_box/game/controller.dart';

import 'package:flip_card_game/surprise_box/game/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CongratulationPopupView extends StatefulWidget {
  const CongratulationPopupView({super.key});

  @override
  State<CongratulationPopupView> createState() =>
      _CongratulationPopupViewState();
}

class _CongratulationPopupViewState extends State<CongratulationPopupView>
    with SingleTickerProviderStateMixin {
  final SurpriseBoxGameController controller = Get.find();

  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> transitionAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutSine),
    );

    transitionAnimation = Tween<double>(begin: 1, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticInOut),
    );

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var background = Container(
      width: Get.width,
      height: Get.height,
      color: Colors.black54,
    );

    return Stack(
      children: [
        background,
        Lottie.asset(controller.effect),
        Center(
          child: Column(
            mainAxisSize: .min,

            children: [
              Stack(
                clipBehavior: .none,
                alignment: .center,
                children: [
                  // header light
                  HeaderLight(assetPath: AppAssets.headerLightHaft),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 2000),
                    builder: (context, double t, _) {
                      return Transform.scale(
                        scale: t,
                        child: HeaderLight(
                          assetPath: AppAssets.headerLightHaft,
                        ),
                      );
                    },
                  ),

                  // content box
                  CongratulationContentBox(),

                  if (controller.winPrizes['tier'] == 3) TopPrizeBadge(),
                ],
              ),
              AnimatedBuilder(
                animation: scaleAnimation,
                builder: (context, _) {
                  return ScaleTransition(
                    scale: scaleAnimation,
                    child: SizedBox(
                      width: 300.h,
                      child: Column(
                        spacing: 10.h,
                        children: [
                          // Extra Button
                          if (controller.winPrizes['extra_buttons'] != null &&
                              controller.winPrizes['extra_buttons'].length > 0)
                            Row(
                              spacing: 10.h,
                              children: [
                                for (var button
                                    in (controller.winPrizes['extra_buttons']
                                        as List))
                                  ExpandedCustomButton(
                                    title: button['text'],
                                    onTap: () => {},
                                  ),
                              ],
                            ),

                          Row(
                            spacing: 10.h,
                            children: [
                              // share button
                              ExpandedCustomButton(
                                title: "Share",
                                backgroundColor: Colors.white,
                                textColor: AppColor.primary,
                                onTap: () => controller.sharePrize(),
                              ),

                              // check prize button
                              ExpandedCustomButton(
                                title: "Check Prize",
                                backgroundColor: Colors.white,
                                textColor: AppColor.primary,
                                onTap: () => {},
                              ),
                            ],
                          ),

                          Row(
                            spacing: 10.h,
                            children: [
                              ExpandedCustomButton(
                                title: "Exit",
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                onTap: () => {Get.offAllNamed(AppRoute.splash)},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
