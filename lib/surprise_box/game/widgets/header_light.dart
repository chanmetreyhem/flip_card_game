import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderLight extends StatelessWidget {
  final String assetPath;
  const HeaderLight({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -160.h,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 100),
        builder: (context, t, w) {
          return Transform.scale(
            scale: t,
            child: SizedBox(
              width: 300.h,
              height: 200.h,
              child: Image.asset(assetPath),
            ),
          );
        },
      ),
    );
  }
}
