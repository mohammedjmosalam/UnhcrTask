import 'dart:async';

import 'package:flutter/material.dart';
import 'package:template_project/config/routes/app_route.dart';
import 'package:template_project/core/screens/base_screen/base_screen.dart';
import 'package:template_project/core/utilities/assets/app_assets.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';
import 'package:template_project/core/widget/app_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, AppRoute.home);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen.emptyPage(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.iconPath(
            iconPath: AppAssets.images.logoApp,
            widthIcon: 80.percentageWidth,
          ),
          CircularProgressIndicator(
            color: context.theme.appMainColor,
          )
        ],
      ),
    );
  }
}
