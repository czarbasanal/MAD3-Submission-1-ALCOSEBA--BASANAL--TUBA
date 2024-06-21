import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mad3_submission_1/controllers/auth_controller.dart';
import 'package:mad3_submission_1/enum/enum.dart';

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
}
