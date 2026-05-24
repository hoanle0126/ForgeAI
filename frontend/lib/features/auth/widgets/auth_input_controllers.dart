import 'package:flutter/material.dart';

class AuthInputControllers {
  final name = TextEditingController();
  final email = TextEditingController();
  final otp = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  void dispose() {
    name.dispose();
    email.dispose();
    otp.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
