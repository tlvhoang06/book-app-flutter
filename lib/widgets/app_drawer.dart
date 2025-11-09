import 'package:bookapp/core/services/auth_provider.dart';
import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
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
    Future<void> logout() async {
      final auth = ref.watch(authServiceProvider);
      await auth.signOut();
    }

    return Drawer(
      backgroundColor: colors.primary,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      ref.read(isDarkModeProvider.notifier).state = value;
                    },
                    activeColor: colors.button,
                    inactiveTrackColor: colors.button,
                    trackOutlineWidth: WidgetStatePropertyAll(0),
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
              Divider(
                color: colors.button,
                thickness: 1,
                endIndent: 40,
                indent: 40,
              ),
              InkWell(
                highlightColor: colors.button.withOpacity(0.2),
                onTap: () {
                  logout();
                },
                splashColor: colors.button.withOpacity(0.2),
                child: ListTile(title: Center(child: Text('Log out'))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
