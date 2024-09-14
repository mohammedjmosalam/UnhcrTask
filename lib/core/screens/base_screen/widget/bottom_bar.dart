part of '../base_screen.dart';

class _BottomBarApp extends StatelessWidget {
  const _BottomBarApp({
    required this.iconsOnButtonBar,
    required this.onTap,
    required this.pageSelected,
  });
  final List<TemplateButtonBar> iconsOnButtonBar;
  final Function(int index) onTap;
  final ValueNotifier<int> pageSelected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: pageSelected,
        builder: (context, int currentPageIndex, Widget? child) {
          return BottomNavigationBar(
            items: iconsOnButtonBar
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: _IconBottomBar(
                      templateButtonBar: e,
                      isSelected:
                          currentPageIndex == iconsOnButtonBar.indexOf(e),
                    ),
                    label: e.title,
                    tooltip: e.title,
                  ),
                )
                .toList(),
            onTap: onTap,
            currentIndex: currentPageIndex,
            elevation: 10,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: context.theme.appMainColor,
            showUnselectedLabels: true,
            unselectedItemColor: context.theme.textAndIconColor,
          );
        });
  }
}

class _IconBottomBar extends StatelessWidget {
  const _IconBottomBar({
    required this.templateButtonBar,
    required this.isSelected,
  });
  final TemplateButtonBar templateButtonBar;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return templateButtonBar.imagePath != null
        ? AppIcon.iconPath(
            iconPath: templateButtonBar.imagePath!,
            widthIcon: 7.percentageWidth,
            iconColor: isSelected
                ? templateButtonBar.colorSelected ?? context.theme.appMainColor
                : null,
          )
        : AppIcon.iconSystem(
            iconData: templateButtonBar.iconData!,
            iconColor: isSelected
                ? templateButtonBar.colorSelected ?? context.theme.appMainColor
                : null,
          );
  }
}
