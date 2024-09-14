import 'package:flutter/material.dart';
import 'package:template_project/core/screens/base_screen/base_screen.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';
import 'package:template_project/core/widget/app_icon.dart';
import 'package:template_project/core/widget/app_text.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen.emptyPage(
      body: SizedBox(
        width: 100.percentageWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppIcon.iconSystem(
              iconData: Icons.cloud_off,
              sizeIcon: 30,
            ),
            AppText(
              text: context.lang.connectionError,
              fontSize: 18,
            ),
            AppIcon.iconSystem(
              iconData: Icons.refresh,
              iconColor: Colors.green,
              sizeIcon: 24,
              onTap: () async {
                bool isBackOnLine =
                    await context.appController.reCheckConnection();
                if (isBackOnLine) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
