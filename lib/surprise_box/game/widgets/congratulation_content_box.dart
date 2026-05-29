import 'package:flip_card_game/surprise_box/game/controller.dart';
import 'package:flip_card_game/surprise_box/game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CongratulationContentBox extends StatefulWidget {
  const CongratulationContentBox({super.key});

  @override
  State<CongratulationContentBox> createState() =>
      _CongratulationContentBoxState();
}

class _CongratulationContentBoxState extends State<CongratulationContentBox>
    with SingleTickerProviderStateMixin {
  final SurpriseBoxGameController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1),
      duration: Duration(milliseconds: 300),
      builder: (context, t, _) {
        return Transform.scale(
          scale: t,
          child: Container(
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
                      subDescription: controller.winPrizes['sub_description'],
                    ),

                    // View Detail Button
                    if (controller.winPrizes['detail'] != null)
                      ViewDetailButton(),
                  ],
                ),
                // Brand Info
                BrandInfo(
                  brandName:
                      controller.winPrizes['brand']['name'] ?? 'Untitled',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
