import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString title = 'Aqarat'.obs;

  RxBool isPressed = false.obs;
  RxList properties = [].obs;
  
  RxInt buttonIndex = 0.obs;

   buttonIndexChange(int index) {
    buttonIndex.value = index;
  }

  isPressedChange() {
    isPressed.value = !isPressed.value;
  }

 

  Future fetchProperties() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('properties')
        .where('vip', isEqualTo: false)
        .get();
    properties.value = querySnapshot.docs;
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
  Future<void> onInit() async {
    await fetchProperties();

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
