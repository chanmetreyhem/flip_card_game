import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/surprise_box/game/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class PrizeCard extends StatefulWidget {
  final int index;
  const PrizeCard({super.key, required this.index});
  @override
  _PrizeCardState createState() => _PrizeCardState();
}

class _PrizeCardState extends State<PrizeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final gameController = Get.find<SurpriseBoxGameController>();
  late ImageProvider prizeImage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _flipCard() async {
    if (!gameController.isClickable) return;
    if (_controller.isDismissed) {
      await gameController.flipCard(widget.index);
      prizeImage = await preloadNetworkImage(
        gameController.winPrizes['image_url_win'],
      );
      await _controller.forward();
      await gameController.showCongratulationPopup();
    } else if (_controller.isCompleted) {
      _controller.reverse();
    }
  }

  Future<ImageProvider> preloadNetworkImage(String url) async {
    final imageProvider = CachedNetworkImageProvider(url);
    final completer = Completer<ImageProvider>();

    final ImageStream stream = imageProvider.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        if (!completer.isCompleted) {
          completer.complete(imageProvider);
        }
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        if (!completer.isCompleted) {
          completer.completeError(exception, stackTrace);
        }
      },
    );

    stream.addListener(listener);

    try {
      final result = await completer.future;
      return result;
    } finally {
      stream.removeListener(listener);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value;
          final isFrontVisible = angle <= pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateY(angle),
            child: isFrontVisible
                ? _buildFront()
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: _buildBack(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      height: 400,
      width: 400,
      alignment: Alignment.center,

      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.board)),
      ),
      child: Image.asset(AppAssets.questionMarkBoard, fit: .contain),
    );
  }

  Widget _buildBack() {
    final SurpriseBoxGameController controller = Get.find();
    return Container(
      height: 400,
      width: 400,
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.board)),
      ),
      child: Obx(() {
        return Column(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: prizeImage),
                ),
              ),
            ),
            Center(
              child: Text(
                controller.winPrizes['title'] ?? 'Untitled',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      }),
    );
  }
}
