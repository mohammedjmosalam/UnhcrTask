import 'package:flutter/material.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';
import 'package:template_project/core/widget/app_icon.dart';
import 'package:template_project/core/widget/app_text.dart';
import 'entity/template_button_bar.dart';
part 'widget/app_bar.dart';
part 'widget/bottom_bar.dart';

class BaseScreen extends StatelessWidget {
  // * white page
  const BaseScreen.emptyPage({
    super.key,
    this.keyScaffold,
    this.backgroundColor,
    this.bottomSheet,
    this.floatingActionButton,
    required this.body,
    this.backgroundImagePath,
  })  : isWithAppBar = false,
        isWithBackButton = false,
        title = '',
        onTapItemButtonBar = null,
        pageSelected = null,
        onPressBack = null,
        titleFontSize = null,
        iconsOnButtonBar = const [],
        actions = const [],
        drawable = null,
        customAppBar = null;
  // *  page with app bar only

  const BaseScreen.withAppBar({
    required this.title,
    required this.body,
    this.customAppBar,
    this.floatingActionButton,
    super.key,
    this.titleFontSize,
    this.bottomSheet,
    this.onPressBack,
    this.drawable,
    this.isWithBackButton = true,
    this.keyScaffold,
    this.backgroundColor,
    this.backgroundImagePath,
    this.actions = const [],
  })  : isWithAppBar = true,
        onTapItemButtonBar = null,
        pageSelected = null,
        iconsOnButtonBar = const [];
  // *  page with app bar and button bar
  const BaseScreen.withAppBarAndButtonBar({
    super.key,
    required this.iconsOnButtonBar,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.titleFontSize,
    required Function(int index) this.onTapItemButtonBar,
    required ValueNotifier<int> this.pageSelected,
    this.drawable,
    this.bottomSheet,
    this.onPressBack,
    this.customAppBar,
    this.isWithBackButton = true,
    this.keyScaffold,
    this.backgroundColor,
    this.backgroundImagePath,
    this.actions = const [],
  }) : isWithAppBar = true;
  // *  page with app bar and button bar
  const BaseScreen.buttonBar({
    super.key,
    this.bottomSheet,
    required this.iconsOnButtonBar,
    required this.body,
    required Function(int index) this.onTapItemButtonBar,
    required ValueNotifier<int> this.pageSelected,
    this.keyScaffold,
    this.floatingActionButton,
    this.backgroundColor,
    this.backgroundImagePath,
  })  : isWithAppBar = false,
        isWithBackButton = false,
        title = '',
        titleFontSize = null,
        onPressBack = null,
        actions = const [],
        drawable = null,
        customAppBar = null;

  final bool isWithAppBar;
  final bool isWithBackButton;
  final String? backgroundImagePath;
  final GlobalKey<ScaffoldState>? keyScaffold;
  final String title;
  final Widget? drawable;
  final List<Widget> actions;
  final List<TemplateButtonBar> iconsOnButtonBar;
  final Function(int index)? onTapItemButtonBar;
  final ValueNotifier<int>? pageSelected;
  final Widget body;
  final PreferredSizeWidget? customAppBar;
  final Function()? onPressBack;
  final Widget? bottomSheet;
  final double? titleFontSize;
  final Color? backgroundColor;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      appBar: isWithAppBar
          ? (customAppBar ??
              _AppBarApp(
                actions: actions,
                titleFontSize: titleFontSize,
                hightAppBar: MediaQuery.sizeOf(context).height * 0.08,
                isWithBackButton: isWithBackButton,
                isWithDrawable: drawable != null,
                title: title,
                keyScaffold: keyScaffold,
                onPressBack: onPressBack,
              ))
          : null,
      backgroundColor: backgroundColor ?? context.theme.bodyColorApp,
      drawer: drawable,
      key: keyScaffold,
      bottomNavigationBar: iconsOnButtonBar.isNotEmpty
          ? _BottomBarApp(
              iconsOnButtonBar: iconsOnButtonBar,
              onTap: onTapItemButtonBar!,
              pageSelected: pageSelected!,
            )
          : null,
      body: Container(
          width: 100.percentageWidth,
          decoration: backgroundImagePath != null
              ? BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      backgroundImagePath!,
                    ),
                  ),
                )
              : null,
          child: body),
    );
  }
}
