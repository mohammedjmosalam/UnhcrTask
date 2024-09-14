import 'package:flutter/material.dart';

class TemplateButtonBar {
  final String title;

  final IconData? iconData;
  final String? imagePath;
  final ValueNotifier<int>? badgesNotifier;
  final Color? colorSelected;
  TemplateButtonBar.icon({
    required IconData this.iconData,
    required this.title,
    this.badgesNotifier,
    this.colorSelected,
  }) : imagePath = null;
  TemplateButtonBar.image({
    required String this.imagePath,
    required this.title,
    this.badgesNotifier,
    this.colorSelected,
  }) : iconData = null;
}
