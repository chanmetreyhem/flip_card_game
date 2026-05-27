import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RandomText extends StatelessWidget {
  final String title;
  final String description;
  const RandomText({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(
          title,
          textAlign: .center,
          style: Get.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
        ),
        Text(description, textAlign: .center, style: Get.textTheme.bodyLarge),
      ],
    );
  }
}
