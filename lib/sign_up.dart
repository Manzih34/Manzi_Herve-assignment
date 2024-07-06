import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_service.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final AuthService _authService = Get.put(AuthService());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF1E88E5), // Updated Color 1
                Color(0xFF0D47A1), // Updated Color 2
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E88E5), // Updated Label Color
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E88E5), // Updated Label Color
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF1E88E5), // Updated Gradient Color 1
                          Color(0xFF0D47A1), // Updated Gradient Color 2
                        ]),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () async {
                            try {
                              await _authService.signUpWithEmail(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );
                              Get.offAllNamed('/sign_in');
                            } catch (e) {
                              Get.snackbar('Error', e.toString(),
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await _authService.signInWithGoogle();
                          Get.offAllNamed('/home');
                        } catch (e) {
                          Get.snackbar('Error', e.toString(),
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                      child: const Text('Sign Up with Google'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF1E88E5), // Updated Gradient Color 1
                          Color(0xFF0D47A1), // Updated Gradient Color 2
                        ]),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Get.offAllNamed('/sign_in');
                          },
                          child: const Text(
                            'Already have an account? Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
