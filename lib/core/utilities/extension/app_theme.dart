import 'package:flutter/material.dart';

extension AppThemeColor on ThemeData {
  bool get isDarkMode => brightness == Brightness.dark;
  Color get textAndIconColor => isDarkMode ? Colors.white : Colors.black;
  Color get appMainColor => const Color(0xff117ac0);
  Color get dropDownBorderColor =>
      isDarkMode ? Colors.white : const Color(0xffe7e8ea);
  Color get borderColor => isDarkMode ? Colors.white : Colors.white;
  Color get appCardColor => isDarkMode ? Colors.black : Colors.white;
  Color get appBarColor =>
      isDarkMode ? const Color.fromARGB(255, 32, 31, 31) : Colors.white;
  Color get bodyColorApp => isDarkMode
      ? const Color.fromARGB(255, 65, 62, 62)
      : const Color(0xffECEDF3);
}
