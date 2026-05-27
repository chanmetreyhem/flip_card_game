import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewDetailButton extends StatelessWidget {
  const ViewDetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.h),
        ),
        backgroundColor: Colors.lightGreen.shade50,
      ),
      child: Text(
        'View Detail',
        style: TextStyle(fontSize: 14.h, color: Colors.green),
      ),
    );
  }
}
