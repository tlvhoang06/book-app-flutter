import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:bookapp/widgets/app_drawer.dart';
import 'package:bookapp/widgets/neu_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return Scaffold(
      backgroundColor: colors.background,

      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10),
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                splashColor: colors.button,
                child: NeuBox(
                  color: colors.background,
                  height: 50,
                  width: 50,
                  radius: 20,
                  child: Icon(UniconsLine.apps),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
