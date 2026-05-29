import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../call_api.dart';

class SurpriseBoxGameController extends GetxController {
  final congratulationBoard = [
    AppAssets.prizeBlueBoard,
    AppAssets.prizeGreenBoard,
    AppAssets.prizeYellowBoard,
  ];

  final congratulationEffect = [
    AppLotties.blueEffect,
    AppLotties.greenEffect,
    AppLotties.yellowEffect,
  ];

  final headerCongratulationLight = [
    AppAssets.headerLightHaft,
    AppAssets.headerLightHaft,
    AppAssets.headerLightHaft,
  ];

  final _boardImage = AppAssets.prizeBlueBoard.obs;
  String get boardImage => _boardImage.value;

  final _effect = AppLotties.blueEffect.obs;
  String get effect => _effect.value;

  final _headerLight = AppAssets.headerLightHaft.obs;
  String get headerLight => _headerLight.value;

  final _wingPoint = 0.obs;
  int get wingPoint => _wingPoint.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isCongratulation = false.obs;
  bool get isCongratulation => _isCongratulation.value;

  final _isClickable = true.obs;
  bool get isClickable => _isClickable.value;

  final _title = ''.obs;
  String get title => _title.value;
  final _description = ''.obs;
  String get description => _description.value;

  final _winPrizes = <String, dynamic>{}.obs;
  Map<String, dynamic> get winPrizes => _winPrizes.value;

  List<String> bigPrizes = [];

  @override
  void onInit() {
    final gameInfo = Get.arguments as Map<String, dynamic>;
    final userInfo = gameInfo['user_info'] as Map<String, dynamic>;

    setBigPrizeImageList(gameInfo);

    _wingPoint.value = userInfo['wing_point'];

    _title.value = gameInfo['random_text_play']['title'];
    _description.value = gameInfo['random_text_play']['sub_title'];

    super.onInit();
  }

  void setBigPrizeImageList(Map<String, dynamic> gameInfo) {
    var prizesList = gameInfo['big_prizes'] as List?;

    if (prizesList != null) {
      for (var p in prizesList) {
        if (p != null && p['image_url'] != null) {
          bigPrizes.add(p['image_url']);
        }
      }
    }
  }

  Future<void> flipCard(int index) async {
    _isClickable.value = false;

    final result = await onSurpriseBoxFunctionRequest(
      function: 'flip-card',
      data: {'card_number': index},
    );

    await await Future.delayed(Duration(milliseconds: 1500));

    _winPrizes.value = result!['win_prize'] as Map<String, dynamic>;

    // ignore: invalid_use_of_protected_member
    int tier = _winPrizes.value['tier'] ?? 0;
    int matchedIndex = tier > 0 ? tier - 1 : 0;
    setUpCongratulationUI(matchedIndex);
  }

  Future<void> showCongratulationPopup() async {
    await await Future.delayed(Duration(milliseconds: 500));
    _isCongratulation.value = true;
  }

  void setUpCongratulationUI(int matchedIndex) {
    _boardImage.value = congratulationBoard[matchedIndex];
    _effect.value = congratulationEffect[matchedIndex];
    _headerLight.value = headerCongratulationLight[matchedIndex];
  }

  void sharePrize() {
    Get.toNamed(AppRoute.share, arguments: _winPrizes.value);
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
}
