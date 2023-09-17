import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    required this.width,
    required this.height,
    required this.isSelected,
    super.key,
    this.color,
    this.borderRadius,
    this.child,
  });

  final double width;
  final double height;
  final Color? color;
  final double? borderRadius;
  final Widget? child;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(borderRadius ?? 40.r),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white,
            width: 5.w,
          ),
        ),
        child: child,
      ),
    );
  }
}
