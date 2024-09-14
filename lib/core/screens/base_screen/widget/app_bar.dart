part of '../base_screen.dart';

class _AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarApp({
    required this.hightAppBar,
    required this.title,
    required this.actions,
    required this.isWithBackButton,
    required this.isWithDrawable,
    this.keyScaffold,
    this.onPressBack,
    this.titleFontSize,
  });
  final double hightAppBar;
  final String title;
  final bool isWithBackButton;
  final bool isWithDrawable;
  final List<Widget> actions;
  final GlobalKey<ScaffoldState>? keyScaffold;
  final Function()? onPressBack;
  final double? titleFontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: onPressBack != null ? false : isWithBackButton,
      title: AppText(
        text: title,
        fontSize: titleFontSize ?? 15,
        colorText: context.theme.textAndIconColor,
      ),
      centerTitle: true,
      leading: onPressBack != null
          ? AppIcon.iconSystem(
              iconData: Icons.arrow_back,
              onTap: onPressBack,
              iconColor: Colors.white,
            )
          : null,
      actions: actions
          .followedBy(isWithDrawable
              ? [
                  AppIcon.iconSystem(
                    iconData: Icons.menu,
                    onTap: () {
                      if (keyScaffold?.currentState?.isDrawerOpen ?? false) {
                        keyScaffold?.currentState?.closeDrawer();
                      } else {
                        keyScaffold?.currentState?.openDrawer();
                      }
                    },
                    iconColor: context.theme.textAndIconColor,
                  ),
                ]
              : [])
          .toList(),
      backgroundColor: context.theme.appBarColor,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, hightAppBar);
}
