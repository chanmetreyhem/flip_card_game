import 'package:flutter/material.dart';

import '../../../assets.dart';

class WingPointBox extends StatelessWidget {
  final int wingPoint;
  const WingPointBox({super.key, required this.wingPoint});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 35,
      alignment: .center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 10,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.wingPointIcon),
              ),
            ),
          ),
          Expanded(
            child: Text(
              wingPoint.toString(),
              textAlign: .left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: .bold,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
