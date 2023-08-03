import 'package:flutter/material.dart';
import 'package:todo_task/auth/login_screen_body.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: const LoginScreenBody(),
    );
  }
}
