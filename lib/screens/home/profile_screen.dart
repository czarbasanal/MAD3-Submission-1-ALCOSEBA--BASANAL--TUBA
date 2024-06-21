import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = "/profile";
  static const String name = "Profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //add profile UI here and logout button
    return const Center(child: Text("Profile"));
  }
}
