import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRoomController extends GetxController {
  //TODO: Implement ChatRoomController
  RxString title = 'Chats'.obs;

  // lets get the Id from the previous screen with arguments
  RxString userId = ''.obs;
  final arguments = Get.arguments;
 
  // create a function to check if the user is looged in or not with firebase
  Future checkIfUserIsLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId.value = user.uid;
    } else {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'You are not logged in',
        textConfirm: 'Login',
        cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.toNamed('/login');
        },
      );
    }
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
