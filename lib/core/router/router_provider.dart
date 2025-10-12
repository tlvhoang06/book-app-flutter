import 'package:bookapp/core/services/auth_provider.dart';
import 'package:bookapp/pages/loading_page.dart';
import 'package:bookapp/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bookapp/pages/auth/register_page.dart';
import 'package:bookapp/pages/home_page.dart';
import 'package:bookapp/pages/profile_page.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (previous, next) => notifyListeners());
  }

  List<GoRoute> get routes => [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
    GoRoute(
      path: '/loading',
      builder: (context, state) =>
          LoadingPage(),
    ),
  ];
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final routerNotifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: routerNotifier.routes,
    redirect: (context, state) {
      return authState.when(
        data: (user) {
          if (user != null && state.matchedLocation != '/') {
            return '/';
          }
          if (user == null && state.matchedLocation != '/login') {
            return '/login';
          }
          return null;
        },
        error: (error, stack) {
          return '/login';
        },
        loading: () => '/loading',
      );
    },
    refreshListenable: routerNotifier,
  );
});
