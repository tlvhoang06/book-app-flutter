import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appColorProvider = Provider<AppColor>((ref) {
  final isDark = ref.watch(isDarkModeProvider);
  return AppColor(isDark);
});

class AppColor {
  final bool isDarkMode;
  AppColor(this.isDarkMode);
  Color get background =>
      isDarkMode ? const Color(0XFF092327) : const Color(0xFFC7F9CC);
  Color get primary =>
      isDarkMode ? const Color(0XFFbde0fe) : const Color(0XFF84e1bc);
  Color get secondary =>
      isDarkMode ? const Color(0XFFfadde1) : const Color(0XFF71f79f);
  Color get button =>
      isDarkMode ? const Color(0XFFfb6f92) : const Color(0XFF00ffc5);
  Color get text => isDarkMode ? Color(0XFF172a3a) : const Color(0XFF036666);
  Color error = Color(0xFFE94560);
  Color linktext = Color(0XFFb2f7ef);
  List<Color> get gradient => [primary, secondary, button];
}
