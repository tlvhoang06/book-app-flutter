import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTexField extends ConsumerWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final bool hideText;
  const CustomTexField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.hideText,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: colors.primary, width: 1.8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: colors.button, width: 2.2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colors.error, width: 1.8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colors.error, width: 2.2),
          ),
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(color: colors.text),
          fillColor: colors.primary,
          filled: true,
        ),
        controller: controller,
        obscureText: hideText,
        cursorColor: colors.text,
      ),
    );
  }
}
