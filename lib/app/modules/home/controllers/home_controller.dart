import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString title = 'Aqarat'.obs;

  RxBool isPressed = false.obs;
  RxBool isPressed2 = false.obs;

  isPressedChange() {
    isPressed.value = !isPressed.value;
  }

  isPressedChange2() {
    isPressed2.value = !isPressed2.value;
  }

  changeIndex(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/chat-room');
        break;
      case 2:
        Get.toNamed('/favourite');
        break;

      default:
        Get.toNamed('/home');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
