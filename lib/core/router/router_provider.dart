import 'package:bookapp/core/services/auth_provider.dart';
import 'package:bookapp/pages/loading_page.dart';
import 'package:bookapp/pages/auth/login_page.dart';
import 'package:bookapp/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bookapp/pages/auth/register_page.dart';
import 'package:bookapp/pages/home_page.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (previous, next) => notifyListeners());
  }

  List<GoRoute> get routes => [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/welcome', builder: (context, state) => const WelcomePage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/loading', builder: (context, state) => LoadingPage()),
  ];
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final routerNotifier = ref.watch(routerNotifierProvider);
  return GoRouter(
    initialLocation: '/welcome',
    routes: routerNotifier.routes,
    redirect: (context, state) {
      final location = state.matchedLocation;
      return authState.when(
        data: (user) {
          final isAuth = user != null;
          final isAuthRoute =
              location == '/login' ||
              location == '/register' ||
              location == '/welcome' ||
              location == '/loading';
          if (!isAuth && !isAuthRoute) {
            return '/welcome';
          }
          if (isAuth) {
            return '/home';
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
