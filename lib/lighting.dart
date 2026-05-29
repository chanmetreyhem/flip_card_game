import 'package:flip_card_game/assets.dart';
import 'package:flutter/material.dart';
import 'package:lightning_overlay/lightning_overlay.dart';

class LightningCard extends StatefulWidget {
  const LightningCard({super.key});

  @override
  LightningCardState createState() => LightningCardState();
}

class LightningCardState extends State<LightningCard> {
  @override
  void initState() {
    super.initState();
  }

  LightningController controller = LightningController();

  void animate() async {
    controller.animateIn();
    await Future.delayed(const Duration(seconds: 1));
    controller.animateOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lightning(
              useGesture: false,
              borderRadius: 15,
              repeatInfinity: true,
              delayDuration: const Duration(milliseconds: 300),
              controller: controller,
              direction: LightningDirection.leftToRight,
              pauseDuration: const Duration(milliseconds: 200),
              durationIn: const Duration(milliseconds: 300),
              durationOut: const Duration(milliseconds: 450),
              overlayColor: const Color.fromARGB(
                255,
                0,
                81,
                255,
              ).withValues(alpha: 1),
              child: Container(
                height: 300,
                width: 500,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image.asset(AppAssets.circleFrame, width: 200),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () => animate(),
            child: Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  "Animate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
