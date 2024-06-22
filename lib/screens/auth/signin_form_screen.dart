import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:mad3_submission_1/controllers/auth_controller.dart';
import 'package:mad3_submission_1/dialogs/waiting_dialog.dart';
import 'package:mad3_submission_1/enum/enum.dart';
import 'package:mad3_submission_1/routing/router.dart';
import 'package:mad3_submission_1/screens/home/home_screen.dart';
import 'package:mad3_submission_1/screens/home/wrapper.dart';
import 'package:mad3_submission_1/utils/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String route = "/signin";
  static const String name = "Sign In";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor2,
              backgroundColor2,
              backgroundColor4,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                "Hello Again!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  color: textColor1,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Welcome back, you've\nbeen missed!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 27, color: textColor2, height: 1.2),
              ),
              SizedBox(height: size.height * 0.04),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // for username and password
                    customTextField(
                      "Username",
                      Colors.white,
                      false,
                      _usernameController,
                      _usernameFocusNode,
                      _passwordFocusNode,
                    ),
                    customTextField(
                      "Password",
                      Colors.black26,
                      true,
                      _passwordController,
                      _passwordFocusNode,
                      null,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Recovery Password               ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textColor2,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // for sign in button
                          ElevatedButton(
                            onPressed: _submit, //refer _submit method below
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 150),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.06),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2,
                                width: size.width * 0.2,
                                color: Colors.black12,
                              ),
                              Text(
                                "  Or continue with   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor2,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: size.width * 0.2,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.06),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              socialIcon("lib/assets/images/google.png"),
                              socialIcon("lib/assets/images/apple.png"),
                              socialIcon("lib/assets/images/facebook.png"),
                            ],
                          ),
                          SizedBox(height: size.height * 0.07),
                          Text.rich(
                            TextSpan(
                                text: "Not a member? ",
                                style: TextStyle(
                                  color: textColor2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                children: const [
                                  TextSpan(
                                    text: "Register now",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container socialIcon(String image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    );
  }

  Container customTextField(
    String hint,
    Color color,
    bool isPassword,
    TextEditingController controller,
    FocusNode currentFocusNode,
    FocusNode? nextFocusNode,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: currentFocusNode,
        obscureText: isPassword ? _obscureText : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 22,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 19,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_fill,
                    color: color,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: onErrorColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: isPassword
            ? MultiValidator([
                RequiredValidator(errorText: "Password is required"),
                MinLengthValidator(12,
                    errorText: "Password must be at least 12 characters long"),
                MaxLengthValidator(128,
                    errorText: "Password cannot exceed 128 characters"),
                PatternValidator(
                    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+?\-=[\]{};':,.<>]).*$",
                    errorText:
                        'Password must contain at least one symbol, one uppercase letter, one lowercase letter, and one number.')
              ]).call
            : MultiValidator([
                RequiredValidator(errorText: 'Please fill out the username'),
                MaxLengthValidator(32,
                    errorText: "Username cannot exceed 32 characters"),
                PatternValidator(r'^[a-zA-Z0-9 ]+$',
                    errorText: 'Username cannot contain special characters'),
              ]).call,
        onEditingComplete: () {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await WaitingDialog.show(
        context,
        future: AuthController.I.login(
          _usernameController.text,
          _passwordController.text,
        ),
      );
      if (AuthController.I.state == AuthState.authenticated) {
        GlobalRouter.I.router.go(HomeScreen.route);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Success')),
        );
      } else {
        // Handle login failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed, please try again.')),
        );
      }
    }
  }
}
