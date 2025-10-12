import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends ConsumerWidget {
  final String title;
  final VoidCallback action;
  const CustomButton({super.key, required this.title, required this.action});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return ElevatedButton(
      onPressed: () {
        action();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.button,
        fixedSize: Size(390, 80),
        elevation: 6,
        shadowColor: colors.primary.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: colors.text,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
