import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:bookapp/widgets/button.dart';
import 'package:bookapp/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _slideController = PageController();
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 238, 198),
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _slideController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/girl.png',
                  height: 500,
                  width: 500,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 30,),
                Text(
                  'Your Reading, Your Way',
                  style: TextStyle(
                    fontSize: 32,
                    color: colors.text.withGreen(190),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Customize your library, switch themes, and enjoy a reading space built for you..',
                  style: TextStyle(
                    fontSize: 18,
                    color: colors.text,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100,),
                PageIndicator(slideController: _slideController),
                SizedBox(height: 50,),
                CustomButton(
                  title: "Get Started",
                  action: () {
                    context.push('/register');
                  },
                  height: 60,
                  width: 300,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 30),
                  // child: Lottie.asset(
                  //   'assets/lotties/progress.json',
                  //   height: 350,
                  //   repeat: false,
                  // ),
                ),

                SizedBox(height: 100),
                PageIndicator(slideController: _slideController),
                SizedBox(height: 100),
                CustomButton(
                  title: "Get Started",
                  action: () {
                    context.push('/register');
                  },
                  height: 60,
                  width: 300,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 30),
                  child: Lottie.asset('assets/lotties/robot.json', height: 350),
                ),
                Text(
                  'Read Smarter with',
                  style: TextStyle(
                    fontSize: 32,
                    color: colors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Readora',
                  style: TextStyle(
                    fontSize: 32,
                    color: colors.text.withGreen(190),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Let our AI assistant summarize chapters, suggest books, and guide your reading journey.',
                  style: TextStyle(
                    fontSize: 18,
                    color: colors.text,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100),
                PageIndicator(slideController: _slideController),
                SizedBox(height: 80),
                CustomButton(
                  title: "Get Started",
                  action: () {
                    context.push('/register');
                  },
                  height: 60,
                  width: 300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
