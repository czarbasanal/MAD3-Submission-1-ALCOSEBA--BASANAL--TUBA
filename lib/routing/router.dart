import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mad3_submission_1/controllers/auth_controller.dart';
import 'package:mad3_submission_1/enum/enum.dart';
import 'package:mad3_submission_1/screens/auth/signin_form_screen.dart';
import 'package:mad3_submission_1/screens/auth/signin_splash_screen.dart';
import 'package:mad3_submission_1/screens/home/home_screen.dart';
import 'package:mad3_submission_1/screens/home/profile_screen.dart';
import 'package:mad3_submission_1/screens/home/wrapper.dart';

class GlobalRouter {
  // Static method to initialize the singleton in GetIt
  static void initialize() {
    GetIt.instance.registerSingleton<GlobalRouter>(GlobalRouter());
  }

  // Static getter to access the instance through GetIt
  static GlobalRouter get instance => GetIt.instance<GlobalRouter>();

  static GlobalRouter get I => GetIt.instance<GlobalRouter>();

  late GoRouter router;
  late GlobalKey<NavigatorState> _rootNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  GlobalRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: SignInSplashScreen.route,
      redirect: (context, state) {
        final authState = AuthController.I.state;
        final goingToSignIn = state.uri.toString() == SignInScreen.route;
        final goingToSplash = state.uri.toString() == SignInSplashScreen.route;

        if (authState == AuthState.unauthenticated && goingToSplash) {
          return SignInSplashScreen.route;
        }
        if (authState == AuthState.unauthenticated && !goingToSignIn) {
          return SignInScreen.route;
        }

        if (authState == AuthState.authenticated &&
            (goingToSignIn || goingToSplash)) {
          return HomeScreen.route;
        }

        return null;
      },
      refreshListenable: AuthController.I,
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SignInSplashScreen.route,
          name: SignInSplashScreen.name,
          builder: (context, _) => const SignInSplashScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SignInScreen.route,
          name: SignInScreen.name,
          builder: (context, _) => const SignInScreen(),
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => HomeWrapper(child: child),
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: HomeScreen.route,
              name: HomeScreen.name,
              builder: (context, _) => const HomeScreen(),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: ProfileScreen.route,
              name: ProfileScreen.name,
              builder: (context, _) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
