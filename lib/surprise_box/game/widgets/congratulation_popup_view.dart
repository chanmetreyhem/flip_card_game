import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/core/config/config.dart';
import 'package:flip_card_game/router/app_route.dart';
import 'package:flip_card_game/surprise_box/game/controller.dart';

import 'package:flip_card_game/surprise_box/game/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CongratulationPopupView extends StatelessWidget {
  const CongratulationPopupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SurpriseBoxGameController controller = Get.find();

    var background = Container(
      width: Get.width,
      height: Get.height,
      color: Colors.black54,
    );

    var winPrizeInfo = Column(
      spacing: 5.h,
      mainAxisAlignment: .center,
      children: [
        Text(
          controller.winPrizes['title'] ?? 'Untitled',
          textAlign: .center,
          style: AppTextStyle.largeMidNightBlueBold.copyWith(fontSize: 24.h),
        ),
        Text(
          controller.winPrizes['description'] ?? 'Untitled',
          textAlign: .center,
          style: AppTextStyle.normalLightGreySemiBold.copyWith(fontSize: 14.h),
        ),
        Text(
          controller.winPrizes['sub_description'] ?? 'Untitled',
          textAlign: .center,
          style: AppTextStyle.normalPrimarySemiBold.copyWith(fontSize: 12.h),
        ),
      ],
    );

    return Stack(
      children: [
        background,
        Lottie.asset(AppLotties.yellowEffect),
        Center(
          child: Column(
            mainAxisSize: .min,

            children: [
              // contend box
              Stack(
                clipBehavior: .none,
                alignment: .center,
                children: [
                  // header light
                  HeaderLight(assetPath: AppAssets.headerLightHaft),

                  // content box
                  Container(
                    width: 300.h,
                    height: 400.h,
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.boardImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: .spaceAround,
                      spacing: 20.h,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10.h,
                          children: [
                            // win prize Icon
                            WinPrizeIcon(
                              imageUrl: controller.winPrizes['image_url_win'],
                            ),

                            // Prize Info
                            WinPrizeInfo(
                              title: controller.winPrizes['title'],
                              description: controller.winPrizes['description'],
                              subDescription:
                                  controller.winPrizes['sub_description'],
                            ),

                            // View Detail Button
                            if (controller.winPrizes['detail'] != null)
                              ViewDetailButton(),
                          ],
                        ),
                        // Brand Info
                        BrandInfo(
                          brandName:
                              controller.winPrizes['brand']['name'] ??
                              'Untitled',
                        ),
                      ],
                    ),
                  ),

                  if (controller.winPrizes['tier'] == 3) TopPrizeBadge(),
                ],
              ),
              SizedBox(
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
                          onTap: () => Get.toNamed(AppRoute.share),
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
            ],
          ),
        ),
      ],
    );
  }
}
