import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Center(child: Lottie.asset('assets/lotties/loading.json'),),
    ),);
  }
}