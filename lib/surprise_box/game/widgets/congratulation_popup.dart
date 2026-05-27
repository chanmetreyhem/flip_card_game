import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card_game/assets.dart';
import 'package:flip_card_game/core/config/config.dart';
import 'package:flip_card_game/router/app_route.dart';
import 'package:flip_card_game/surprise_box/game/controller.dart';
import 'package:flip_card_game/surprise_box/game/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CongratulationPopup extends StatelessWidget {
  const CongratulationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final SurpriseBoxGameController controller = Get.find();
    var background = Container(
      width: Get.width,
      height: Get.height,
      color: Colors.black54,
    );
    var winPrizeIcon = Container(
      height: 140,
      width: 140,
      // color: Colors.red,controller.winPrizes['image_url_win']
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) =>
            CircularProgressIndicator(),

        imageUrl: controller.winPrizes['image_url_win'],
      ),
    );
    var winPrizeInfo = Column(
      spacing: 5,
      mainAxisAlignment: .center,
      children: [
        Text(
          controller.winPrizes['title'] ?? 'Untitled',
          textAlign: .center,
          style: AppTextStyle.largeMidNightBlueBold,
        ),
        Text(
          controller.winPrizes['description'] ?? 'Untitled',
          textAlign: .center,
          style: AppTextStyle.normalLightGreySemiBold,
        ),
        Text(
          controller.winPrizes['sub_description'] ?? 'Untitled',
          textAlign: .center,
          style: AppTextStyle.normalPrimarySemiBold,
        ),
      ],
    );
    var viewDetailButton = TextButton(
      onPressed: () => {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        backgroundColor: Colors.lightGreen.shade50,
      ),
      child: Text(
        'View Detail',
        style: TextStyle(fontSize: 15, color: Colors.green),
      ),
    );
    var brandInfo = Column(
      mainAxisSize: .min,
      spacing: 10,
      children: [
        SizedBox(
          //color: Colors.red,
          child: Image.asset(
            AppAssets.sep,
            width: double.infinity,
            height: 1,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: .center,
            spacing: 20,
            children: [
              if (!controller.winPrizes['brand']['logo_url']
                  .toString()
                  .contains('https'))
                Image.asset(AppAssets.wingPointIcon, width: 40, height: 40),
              if (controller.winPrizes['brand']['logo_url'].toString().contains(
                'https',
              ))
                Image.network(
                  controller.winPrizes['brand']['logo_url'],
                  width: 40,
                  height: 40,
                ),
              Text(
                controller.winPrizes['brand']['name'] ?? 'Untitled',
                textAlign: .center,
                style: AppTextStyle.normalMidNightBlueBold.copyWith(
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    var topPrizeBadge = Positioned(
      top: 10,
      right: 10,
      child: Container(
        height: 40,
        width: 70,
        alignment: .center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.topPrize),
            fit: BoxFit.contain,
          ),
        ),
        child: Text("TOP PRIZE", style: AppTextStyle.smallWhiteBold),
      ),
    );
    return Stack(
      children: [
        background,
        Lottie.asset(AppLotties.yellowEffect),
        Center(
          child: Column(
            mainAxisSize: .min,

            children: [
              // contend box
              Stack(
                clipBehavior: .none,
                alignment: .center,
                children: [
                  SizedBox(width: 300, height: 400),
                  Positioned(
                    top: -160,
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.asset(AppAssets.headerLightHaft),
                    ),
                  ),
                  Container(
                    // width: 300,
                    // height: 400,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.boardImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: .spaceAround,
                      spacing: 20,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10,
                          children: [
                            // win prize Icon
                            winPrizeIcon,

                            // Prize Info
                            winPrizeInfo,

                            // View Detail Button
                            if (controller.winPrizes['detail'] != null)
                              viewDetailButton,
                          ],
                        ),
                        // Brand Info
                        brandInfo,
                      ],
                    ),
                  ),

                  if (controller.winPrizes['tier'] == 3) topPrizeBadge,
                ],
              ),
              Column(
                spacing: 10,
                children: [
                  // Extra Button
                  if (controller.winPrizes['extra_buttons'] != null &&
                      controller.winPrizes['extra_buttons'].length > 0)
                    SizedBox(
                      height: 60,
                      width: 300,

                      child: Row(
                        spacing: 10,
                        children: [
                          for (var button
                              in (controller.winPrizes['extra_buttons']
                                  as List))
                            ExpandedCustomButton(
                              title: button['text'],
                              onTap: () => {},
                            ),
                        ],
                      ),
                    ),
                  // share and check prize buttons
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: Row(
                      spacing: 10,
                      children: [
                        ExpandedCustomButton(
                          title: "Share",
                          backgroundColor: Colors.white,
                          textColor: AppColor.primary,
                          onTap: () => {},
                        ),
                        ExpandedCustomButton(
                          title: "Check Prize",
                          backgroundColor: Colors.white,
                          textColor: AppColor.primary,
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 60,
                    width: 300,

                    child: Row(
                      spacing: 10,
                      children: [
                        ExpandedCustomButton(
                          title: "Exit",
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          onTap: () => {Get.offAllNamed(AppRoute.splash)},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
