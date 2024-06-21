import 'package:flutter/material.dart';
import 'package:mad3_submission_1/controllers/auth_controller.dart';
import 'package:mad3_submission_1/routing/router.dart';
import 'package:mad3_submission_1/screens/auth/signin_splash_screen.dart';
import 'package:mad3_submission_1/utils/colors.dart';

void main() {
  AuthController.initialize();
  GlobalRouter.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SignInSplashScreen(),
    );
  }
}
