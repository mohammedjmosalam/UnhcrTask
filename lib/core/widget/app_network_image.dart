import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/widget/app_icon.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.boxFit,
    this.errorImageUrl,
    this.height,
    this.width,
    this.backgroundColor,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final String? errorImageUrl;
  final BoxFit? boxFit;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: backgroundColor ?? context.theme.appCardColor,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        fit: boxFit,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey.shade400,
          child: Container(
            height: height,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const AppIcon.iconSystem(
          iconData: Icons.image,
        ),
      ),
    );
  }
}
