import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/theme/colors/colors_manager.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double? imageHeight, imageWidth;
  final BoxFit? fit;

  const CustomNetworkImage({
    super.key,
    required this.url,
    this.imageHeight,
    this.imageWidth,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: imageHeight,
      width: imageWidth,
      fit: fit ?? BoxFit.contain,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: ColorsManager.red,
      ),
    );
  }
}
