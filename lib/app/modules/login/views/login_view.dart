import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return GetX<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/app_logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(200, 50)),
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  String email = emailController.text;
                                  String password = passwordController.text;

                                  // Validation logic similar to registration
                                  if (email.isEmpty || password.isEmpty) {
                                    Get.defaultDialog(
                                      title: 'Error',
                                      middleText: 'Please fill in all fields',
                                    );
                                    return;
                                  }

                                  bool loginSuccess =
                                      await controller.loginWithEmailPassword(
                                    email,
                                    password,
                                  );

                                  if (!loginSuccess) {
                                    Get.snackbar(
                                      'Login Failed',
                                      'Invalid email or password',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Login',
                                  style: TextStyle(color: AppColors.blackColor),
                                ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Get.offNamed('/registration');
                          },
                          child: const Text('Register'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed('/dashboard');
                          },
                          child:
                              const Text('Dont want to Login? Go back To Home'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
