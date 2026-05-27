import 'package:flip_card_game/core/config/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinPrizeInfo extends StatelessWidget {
  final String title;
  final String description;
  final String subDescription;
  const WinPrizeInfo({
    super.key,
    required this.title,
    required this.description,
    required this.subDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      mainAxisAlignment: .center,
      children: [
        Text(
          title,
          textAlign: .center,
          style: AppTextStyle.largeMidNightBlueBold.copyWith(fontSize: 24.h),
        ),
        Text(
          description,
          textAlign: .center,
          style: AppTextStyle.normalLightGreySemiBold.copyWith(fontSize: 14.h),
        ),
        Text(
          subDescription,
          textAlign: .center,
          style: AppTextStyle.normalPrimarySemiBold.copyWith(fontSize: 12.h),
        ),
      ],
    );
  }
}
