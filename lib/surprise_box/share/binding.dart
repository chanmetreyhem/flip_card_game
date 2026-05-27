import 'package:flip_card_game/surprise_box/share/share.dart';
import 'package:get/instance_manager.dart';

class SharePrizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SharePrizeController());
  }
}
