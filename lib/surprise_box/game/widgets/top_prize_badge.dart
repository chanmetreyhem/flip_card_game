import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/core/config/app_style.dart' show AppTextStyle;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopPrizeBadge extends StatelessWidget {
  const TopPrizeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20.h,
      right: 10.h,
      child: Container(
        height: 40.h,
        width: 70.h,
        alignment: .center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.topPrize),
            fit: BoxFit.contain,
          ),
        ),
        child: Text("TOP PRIZE", style: AppTextStyle.smallWhiteBold),
      ),
    );
  }
}
