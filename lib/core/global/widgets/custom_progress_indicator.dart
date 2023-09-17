import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SizedBox(
          height: 50.h,
          width: 50.h,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
