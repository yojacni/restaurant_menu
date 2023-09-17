import 'package:flutter/material.dart';

class CustomBackGroundImage extends StatelessWidget {
  const CustomBackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Image.asset(
        'assets/background.jpg',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
