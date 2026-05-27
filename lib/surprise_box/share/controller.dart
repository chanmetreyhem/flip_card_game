import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SharePrizeController extends GetxController {
  final GlobalKey widgetKey = GlobalKey();
  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      captureAndShare();
    });
  }

  Future<void> captureAndShare() async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      if (widgetKey.currentContext == null) {
        debugPrint("Widget not ready yet");
        return;
      }
      final boundary =
          widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final param = ShareParams(
        files: [
          XFile.fromData(
            pngBytes,
            name: "screenshot.png",
            mimeType: "image/png",
          ),
        ],
      );

      await SharePlus.instance.share(param);

      print("Share");
    } catch (e) {
      debugPrint("Error capturing screenshot: $e");
    }
  }
}
