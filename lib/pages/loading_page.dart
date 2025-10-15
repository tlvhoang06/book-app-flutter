import 'package:bookapp/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      color: Colors.green.shade100,
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/loading.json'),
          Text("Loading Materials..", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),),
    ),);
  }
}