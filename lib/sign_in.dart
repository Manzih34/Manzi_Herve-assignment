// sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_service.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final AuthService _authService = Get.put(AuthService());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authService.signInWithEmail(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                  Get.offAllNamed('/home');
                } catch (e) {
                  Get.snackbar('Error', e.toString(),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

// home_screen.dart


