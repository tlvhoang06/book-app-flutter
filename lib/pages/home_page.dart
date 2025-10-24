import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:bookapp/widgets/app_drawer.dart';
import 'package:bookapp/widgets/decorated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(backgroundColor: colors.background),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            DecoratedCard(
              color: Colors.teal,
              height: 50,
              width: 50,
              radius: 20,
              child: Icon(Icons.abc),
            ),
          ],
        ),
      ),
    );
  }
}
