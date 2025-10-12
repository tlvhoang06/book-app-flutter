import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:bookapp/widgets/button.dart';
import 'package:bookapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors.gradient,
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 40, color: colors.text),
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 20, color: colors.text),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 2,
                shadowColor: Colors.white,
                color: colors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Lottie.asset(
                        "assets/lotties/welcome.json",
                        repeat: true,
                        animate: true,
                        height: 360,
                      ),
                      SizedBox(height: 40),
                      CustomTexField(
                        hintText: "Email",
                        icon: Icon(Icons.alternate_email_sharp),
                        controller: _emailController,
                        hideText: false,
                      ),
                      SizedBox(height: 20),
                      CustomTexField(
                        hintText: "Password",
                        icon: Icon(Icons.key_rounded),
                        controller: _passwordController,
                        hideText: false,
                      ),
                      SizedBox(height: 50),
                      CustomButton(title: "Login", action: () {
                        
                      },)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
