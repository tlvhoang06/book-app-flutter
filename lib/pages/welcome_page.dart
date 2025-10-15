import 'package:bookapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 238, 198),
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Padding(
            padding: EdgeInsetsGeometry.only(left: 30),
            child: Lottie.asset('assets/lotties/welcome.json', height: 380),
          ), CustomButton(title: "Get Started", action: () {
              context.push('/register');
          },)],
        ),
      ),
    );
  }
}
