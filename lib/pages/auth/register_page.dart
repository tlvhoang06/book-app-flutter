import 'package:bookapp/core/services/auth_provider.dart';
import 'package:bookapp/core/themes/colors.dart';
import 'package:bookapp/core/themes/theme_provider.dart';
import 'package:bookapp/widgets/button.dart';
import 'package:bookapp/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:bookapp/core/utils/firebase_error_handler.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<RegisterPage> {
  bool _hidePassword = true;
  String errorMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);

    Future<void> register() async {
      final auth = ref.read(authServiceProvider);
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        setState(() {
          errorMessage = "Email and Password can't be empty!";
        });
        return;
      }
      if (_confirmPasswordController.text.isEmpty) {
        setState(() {
          errorMessage = "Please confirm your password!";
        });
        return;
      }
      if (_confirmPasswordController.text != _passwordController.text) {
        setState(() {
          errorMessage = "Password doesn't match!";
        });
        return;
      }
      try {
        await auth.signUp(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } on FirebaseAuthException catch (error) {
        print(error.code);
        setState(() {
          errorMessage = FirebaseAuthErrorHandler.getErrorMessage(error.code);
        });
      }
    }

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
            SizedBox(height: 45),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40, color: colors.text),
                  ),
                  Text(
                    "Get Started!",
                    style: TextStyle(fontSize: 20, color: colors.text),
                  ),
                  SizedBox(height: 5),
                  Transform.scale(
                    scale: 1.2,
                    child: Switch(
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
                          color: colors.primary,
                        ),
                      ),
                      splashRadius: 20,
                      trackOutlineWidth: WidgetStatePropertyAll(0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    topLeft: Radius.circular(70),
                  ),
                  color: colors.background,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Lottie.asset(
                          "assets/lotties/register.json",
                          repeat: true,
                          animate: true,
                          height: 280,
                        ),
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
                          hideText: _hidePassword,
                        ),
                        SizedBox(height: 20),
                        CustomTexField(
                          hintText: "Confirm Password",
                          icon: Icon(Icons.security),
                          controller: _confirmPasswordController,
                          hideText: _hidePassword,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: !_hidePassword,
                              onChanged: (value) {
                                setState(() {
                                  _hidePassword = !value!;
                                });
                              },
                              activeColor: colors.button,
                              splashRadius: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(3),
                              ),
                            ),
                            Text(
                              "Show password",
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          errorMessage,
                          style: TextStyle(color: colors.error),
                        ),
                        SizedBox(height: 15),
                        CustomButton(
                          title: "Register",
                          action: () {
                            register();
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                context.push('/login');
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(color: colors.button),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
