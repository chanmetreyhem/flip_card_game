import 'package:flip_card_game/surprise_box/game/controller.dart';
import 'package:get/instance_manager.dart';

class SurpriseBoxGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurpriseBoxGameController());
  }
}
