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

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _hidePassword = true;
  String errorMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = AppColor(isDarkMode);

    Future<void> login() async {
      final auth = ref.read(authServiceProvider);
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        setState(() {
          errorMessage = "Email and Password can't be empty!";
        });
        return;
      }
      try {
        await auth.signIn(
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
                    "Login",
                    style: TextStyle(fontSize: 40, color: colors.text),
                  ),
                  Text(
                    "Welcome Back!",
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
                          "assets/lotties/login.json",
                          repeat: true,
                          animate: true,
                          height: 340,
                        ),
                        SizedBox(height: 20),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                    borderRadius: BorderRadiusGeometry.circular(
                                      3,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Show password",
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: colors.button),
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
                          title: "Login",
                          action: () {
                            login();
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account yet?",
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                context.push('/register');
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "Register Now!",
                                style: TextStyle(
                                  color: colors.button,
                                  fontWeight: FontWeight.bold,
                                ),
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
