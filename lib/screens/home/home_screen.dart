import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';
  static const String path = "/home";
  static const String name = "Home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home"));
  }
}
