import 'package:bookapp/views/home_page.dart';
import 'package:bookapp/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _goRouter = GoRouter(
  routes: [
    GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
    GoRoute(path: '/', builder: (context, state) => HomePage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
