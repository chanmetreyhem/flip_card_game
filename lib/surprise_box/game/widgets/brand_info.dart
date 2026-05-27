import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/core/config/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandInfo extends StatelessWidget {
  final String brandName;
  const BrandInfo({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      spacing: 10.h,
      children: [
        SizedBox(
          //color: Colors.red,
          child: Image.asset(
            AppAssets.sep,
            width: double.infinity,
            height: 1.h,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: .center,
            spacing: 20.h,
            children: [
              Image.asset(AppAssets.wingPointIcon, width: 40.h, height: 40.h),

              Text(
                brandName,
                textAlign: .center,
                style: AppTextStyle.normalMidNightBlueBold.copyWith(
                  overflow: TextOverflow.clip,
                  fontSize: 14.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
