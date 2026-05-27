import 'package:flip_card_game/call_api.dart';
import 'package:flip_card_game/router/app_route.dart';
import 'package:get/get.dart';

class SurpriseBoxSplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    login();
  }

  Future<void> login() async {
    await Future.delayed(Duration(milliseconds: 500));

    final result = await onSurpriseBoxFunctionRequest(
      function: 'login',
      data: {},
    );

    if (result != null && result['error'] == null) {
      final gameData = await onSurpriseBoxFunctionRequest(
        function: 'play-now',
        data: {'method': null},
      );
      Get.offNamed(AppRoute.game, arguments: gameData);
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Something went wrong. Please try again.",
        textConfirm: "OK",
        onConfirm: () => Get.back(),
      );
    }
  }
}
