import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinPrizeIcon extends StatelessWidget {
  final String imageUrl;
  const WinPrizeIcon({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 130.h,
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) =>
            CircularProgressIndicator(),

        imageUrl: imageUrl,
      ),
    );
  }
}
