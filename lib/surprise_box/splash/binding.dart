import 'package:flip_card_game/surprise_box/splash/controller.dart';
import 'package:get/get.dart';

class SurpriseBoxSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SurpriseBoxSplashController());
  }
}
