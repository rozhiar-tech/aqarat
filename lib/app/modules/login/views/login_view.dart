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
          backgroundColor: AppColors.greenColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.title.value,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.goldColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Email Input Field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black), // Text color
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                        color: AppColors.blackColor), // Label color
                    filled: true,
                    fillColor: Colors.white, // Background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none, // Remove border
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Password Input Field
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black), // Text color
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                        color: AppColors.blackColor), // Label color
                    filled: true,
                    fillColor: Colors.white, // Background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none, // Remove border
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Login Button for Email/Password
                Obx(() {
                  return SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;
                        bool loginSuccess = await controller
                            .loginWithEmailPassword(email, password);

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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      child: controller.isLoggingIn.isTrue
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                // Registration Button
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your registration navigation logic here
                      // For example: Get.toNamed('/registration');
                      Get.toNamed('/registration');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
