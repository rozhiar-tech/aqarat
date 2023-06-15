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
  RxList chatRooms = [].obs;
  RxString userImage = ''.obs;
  RxString userName = ''.obs;

// send user to the chat Screen with chatroom id
  void goToChatScreen() {
    String chatRoomId = '${userId.value}-xA5lRs5krEa3LKEeVhvT';
    Get.toNamed('/chat', arguments: chatRoomId);
  }

  // create a function to check if the user is looged in or not with firebase
  Future checkIfUserIsLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId.value = user.uid as String;
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

  Future getChatsBasedOnUser() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('chatrooms')
        .where('users', arrayContains: userId.value)
        .get();
    chatRooms.value = querySnapshot.docs;
  }

  Future fetchChatsInsideChatRoom() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('chatrooms')
        .doc('${userId.value}xA5lRs5krEa3LKEeVhvT}')
        .collection('chats')
        .orderBy('time', descending: true)
        .get();
    return querySnapshot.docs;
  }

  Future getUserData() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('xA5lRs5krEa3LKEeVhvT')
        .get();
    userImage.value = documentSnapshot['profilePic'];
    userName.value = documentSnapshot['name'];
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    // await fetchChatsInsideChatRoom();
    await checkIfUserIsLoggedIn();
    await getUserData();
    await getChatsBasedOnUser();
    print(chatRooms);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
