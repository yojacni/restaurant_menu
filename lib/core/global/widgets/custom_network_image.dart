import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) {
        return Image.network(
          'https://www.clipartmax.com/png/middle/213-2131416_restaurant-lamb-clipart-placeholder-image-for-restaurant.png',
          fit: BoxFit.cover,
        );
      },
      placeholder: (context, url) => Container(),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
    );
  }
}
