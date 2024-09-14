import 'package:flutter/material.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';

class AppIcon extends StatelessWidget {
  const AppIcon.iconSystem({
    super.key,
    required IconData this.iconData,
    this.iconColor,
    this.onTap,
    this.sizeIcon = 22,
  })  : widthIcon = null,
        iconPath = null,
        boxFit = null,
        heightIcon = null;
  const AppIcon.iconPath({
    super.key,
    required String this.iconPath,
    this.onTap,
    this.widthIcon,
    this.heightIcon,
    this.iconColor,
    this.boxFit,
  })  : iconData = null,
        sizeIcon = 0;
  final String? iconPath;
  final IconData? iconData;
  final Function()? onTap;
  final Color? iconColor;
  final double sizeIcon;
  final double? widthIcon;
  final double? heightIcon;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: iconPath != null
          ? Image.asset(
              iconPath!,
              color: iconColor,
              width: widthIcon,
              height: heightIcon,
              fit: boxFit,
            )
          : Icon(
              iconData,
              size: sizeIcon,
              color: iconColor ?? context.theme.textAndIconColor,
            ),
    );
  }
}
