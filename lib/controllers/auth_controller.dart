import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mad3_submission_1/enum/enum.dart';
import 'package:hive/hive.dart';

class AuthController with ChangeNotifier {
  static const String hiveBoxName = "authBox";
  static const String hiveKeyAuth = "isAuthenticated";

  // Static method to initialize the singleton in GetIt
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  // Static getter to access the instance through GetIt
  static AuthController get instance => GetIt.instance<AuthController>();
  static AuthController get I => GetIt.instance<AuthController>();

  AuthState state = AuthState.unauthenticated;
  SimulatedAPI api = SimulatedAPI();

  AuthController() {
    loadSession();
  }

  login(String userName, String password) async {
    bool isLoggedIn = await api.login(userName, password);
    if (isLoggedIn) {
      state = AuthState.authenticated;
      await saveSession(true);
      notifyListeners();
    }
  }

  ///write code to log out the user and add it to the home page.
  logout() async {
    state = AuthState.unauthenticated;
    await saveSession(false);
    notifyListeners();
  }

  ///must be called in main before runApp
  ///
  loadSession() async {
    var box = await Hive.openBox(hiveBoxName);
    bool? isAuthenticated = box.get(hiveKeyAuth);
    if (isAuthenticated != null && isAuthenticated) {
      state = AuthState.authenticated;
    }
    notifyListeners();
  }

  saveSession(bool isAuthenticated) async {
    var box = await Hive.openBox(hiveBoxName);
    await box.put(hiveKeyAuth, isAuthenticated);
  }
}

class SimulatedAPI {
  Map<String, String> users = {"testUser": "12345678ABCabc!"};

  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 4));
    if (users[userName] == null) throw Exception("User does not exist");
    if (users[userName] != password)
      throw Exception("Password does not match!");
    return users[userName] == password;
  }
}
