import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card_game/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'share.dart';

class SharePrizeView extends GetView<SharePrizeController> {
  const SharePrizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RepaintBoundary(
          key: controller.widgetKey,
          child: Container(
            width: 272.48,
            height: 334.06,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: .circular(12),
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 14),
                // wing rectangle logo
                SizedBox(
                  width: 67.17,
                  height: 18,
                  child: Image.asset(
                    AppAssets.wingBankIcon,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 14),

                //win prize logo
                SizedBox(
                  // color: Colors.blue,
                  width: 126,
                  height: 109,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(),
                    imageUrl: controller.winPrize['image_url_win'],
                    fit: .contain,
                  ),
                ),

                SizedBox(height: 14),

                // description and title
                Container(
                  padding: EdgeInsets.all(2),
                  width: 225,
                  child: Column(
                    children: [
                      Text(
                        controller.winPrize['description'],
                        textAlign: .center,

                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: .w400,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        controller.winPrize['title'],
                        textAlign: .center,

                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: .w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32),

                // line
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: Colors.grey,
                ),

                SizedBox(height: 14),

                SizedBox(
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // brand icon
                      if (controller.winPrize['brand']['logo_url']
                          .toString()
                          .contains('http'))
                        CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(),
                          imageUrl: controller.winPrize['image_url_win'],
                          width: 32,
                          height: 32,
                          fit: .contain,
                        ),
                      if (!controller.winPrize['brand']['logo_url']
                          .toString()
                          .contains('http'))
                        Image.asset(
                          AppAssets.wingCircleIcon,
                          width: 32,
                          height: 32,
                          fit: .contain,
                        ),

                      SizedBox(width: 8),

                      Flexible(
                        child: Text(
                          controller.winPrize['brand']['name'],
                          textAlign: .center,

                          style: TextStyle(
                            overflow: .ellipsis,
                            fontSize: 16,
                            fontWeight: .w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
