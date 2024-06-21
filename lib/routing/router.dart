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

  //Mexl Gods - Router must react to authentication changes

  // FutureOr<String?> handleRedirect(
  //     BuildContext context, GoRouterState state) async {
  //   if (AuthController.I.state == AuthState.authenticated) {
  //     if (state.matchedLocation == SignInScreen.route) {
  //       return HomeScreen.route;
  //     }
  //     return null;
  //   }
  //   if (AuthController.I.state != AuthState.authenticated) {
  //     if (state.matchedLocation == SignInScreen.route) {
  //       return null;
  //     }
  //     return LoginScreen.route;
  //   }
  //   return null;
  // }

  GlobalRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
    router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: HomeScreen.route,
        // redirect: handleRedirect,
        refreshListenable: AuthController.I,
        routes: [
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: SignInSplashScreen.route,
              name: SignInSplashScreen.name,
              builder: (context, _) {
                return const SignInSplashScreen();
              }),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: SignInScreen.route,
              name: SignInScreen.name,
              builder: (context, _) {
                return const SignInScreen();
              }),
          ShellRoute(
              navigatorKey: _shellNavigatorKey,
              builder: (context, state, child) {
                return HomeWrapper(child: child);
              },
              routes: [
                GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    path: HomeScreen.route,
                    name: HomeScreen.name,
                    builder: (context, _) {
                      return const HomeScreen();
                    }),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  path: ProfileScreen.route,
                  name: ProfileScreen.name,
                  builder: (context, _) => const ProfileScreen(),
                ),
              ])
        ]);
  }
}
