import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends ConsumerWidget {
  final slideController;
  const PageIndicator({super.key, required this.slideController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return SmoothPageIndicator(
      controller: slideController,
      count: 3,
      effect: SlideEffect(
        dotHeight: 12,
        dotWidth: 12,
        activeDotColor: colors.button,
        dotColor: colors.secondary,
        type: SlideType.slideUnder
      ),
    );
  }
}
