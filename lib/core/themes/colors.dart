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
      isDarkMode ? const Color(0xFF212f45) : const Color(0xFFC7F9CC);
  Color get primary =>
      isDarkMode ? const Color(0XFF065a60) : const Color(0xFF80ED99);
  Color get secondary =>
      isDarkMode ? const Color(0xFF206d46) : const Color(0xFF57CC99);
  Color get button =>
      isDarkMode ? const Color(0XFF02c39a) : const Color(0xFF38A3A5);
  Color get text => isDarkMode ? Colors.white : const Color(0XFF172a3a);
  Color error = Color(0xFFE94560);
  Color linktext = Color(0XFFb2f7ef);
  List<Color> get gradient => [background, primary, secondary];
}
