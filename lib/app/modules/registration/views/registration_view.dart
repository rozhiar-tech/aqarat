import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController retypePasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return GetX(
        init: RegistrationController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
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
                        TextFormField(
                          controller: retypePasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Retype Password',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: lastNameController,
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(200, 50)), // Set the desired size here
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  controller.isLoading.value = true;

                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  String retypePassword =
                                      retypePasswordController.text;
                                  String name = nameController.text;
                                  String lastName = lastNameController.text;
                                  String phone = phoneController.text;

                                  if (password != retypePassword) {
                                    Get.defaultDialog(
                                      title: 'Error',
                                      middleText: 'Passwords do not match',
                                    );
                                    controller.isLoading.value = true;
                                    return;
                                  }

                                  bool registrationSuccess =
                                      await controller.register(
                                    email,
                                    password,
                                    name,
                                    lastName,
                                    phone,
                                  );

                                  if (registrationSuccess) {
                                    Get.defaultDialog(
                                      title: 'Success',
                                      middleText: 'Account created!',
                                      onConfirm: () {
                                        Get.offAllNamed('/dashboard');
                                      },
                                    );
                                  } else {
                                    Get.defaultDialog(
                                      title: 'Error',
                                      middleText: 'Please try again',
                                    );
                                  }

                                  controller.isLoading.value = false;
                                },
                          child: controller.isLoading.value
                              ? CircularProgressIndicator()
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            Get.offNamed('/login');
                          },
                          child: const Text('Back to Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
