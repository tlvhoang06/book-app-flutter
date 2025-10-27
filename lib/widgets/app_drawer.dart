import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:bookapp/widgets/neu_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return Drawer(
      backgroundColor: colors.primary,
      child: ListView(
        children: [
          Row(
            children: [
              NeuBox(
                color: Color.alphaBlend(
                  Colors.white.withOpacity(0.6),
                  colors.background,
                ),
                height: 50,
                width: 50,
                radius: 20,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(UniconsLine.arrow_left),
                ),
              ),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  ref.read(isDarkModeProvider.notifier).state = value;
                },
                activeColor: colors.button,
                inactiveTrackColor: colors.button,
                thumbColor: MaterialStateProperty.all(colors.background),
                thumbIcon: MaterialStateProperty.all(
                  Icon(
                    !isDarkMode ? Icons.sunny : Icons.dark_mode,
                    color: isDarkMode ? colors.primary : colors.button,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
