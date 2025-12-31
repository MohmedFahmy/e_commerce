import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder:
          (context, url) => SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
            ),
          ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}