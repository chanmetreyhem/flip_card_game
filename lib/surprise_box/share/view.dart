import 'package:flip_card_game/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'share.dart';

class SharePrizeView extends GetView<SharePrizeController> {
  const SharePrizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        key: controller.widgetKey,
        child: Container(
          padding: .all(50.h),
          width: 300.h,
          height: 300.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .circular(20.h),
            border: Border.all(width: 2, color: Colors.white),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF8A2387), // Deep Violet
                Color(0xFFE94057), // Vivid Red-Pink
              ],
            ),
          ),
          child: Image.asset(AppAssets.coinGroup),
        ),
      ),
    );
  }
}
