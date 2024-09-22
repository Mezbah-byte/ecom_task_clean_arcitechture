import 'package:ecom_task/features/authentication/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Obx(() {
        if (authController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              authController.errorMessage.value.isNotEmpty
                  ? Text(
                      authController.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    )
                  : Container(),
              const SizedBox(height: 20),
              authController.isLoggedIn.value
                  ? const Text('Logged In',
                      style: TextStyle(color: Colors.green))
                  : ElevatedButton(
                      onPressed: () {
                        authController.login(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: const Text('Login'),
                    ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Get.to(SignUpPage());
                  },
                  child: const Text('Go to signUp'))
            ],
          ),
        );
      }),
    );
  }
}
