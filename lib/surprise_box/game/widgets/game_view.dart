import 'package:flip_card_game/surprise_box/game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurpriseBoxGameController>();
    return Obx(() {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: .start,
            children: [
              SizedBox(
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.only(left: 8),
                      alignment: .center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: .circle,
                      ),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    WingPointBox(wingPoint: controller.wingPoint),
                  ],
                ),
              ),

              // Big Prizes
              BigPrizeBox(),

              // Title and Description
              RandomText(
                title: controller.title,
                description: controller.description,
              ),

              SizedBox(height: 10),

              // Box Grid
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columns
                    crossAxisSpacing: 12, // optional spacing between columns
                    mainAxisSpacing: 12, // optional spacing between rows
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return PrizeCard(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
