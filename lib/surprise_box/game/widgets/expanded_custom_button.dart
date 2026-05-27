import 'package:flutter/material.dart';

import '../../../core/config/config.dart';

class ExpandedCustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color backgroundColor;
  final Color textColor;

  const ExpandedCustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.backgroundColor = AppColor.primary,
    this.textColor = AppColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: .center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColor.white),
          ),
          child: Text(
            title,
            style: AppTextStyle.mediumWhiteBold.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
