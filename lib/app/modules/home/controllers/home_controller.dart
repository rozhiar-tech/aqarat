import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString title = 'Aqarat'.obs;

  RxBool isPressed = false.obs;
  RxList properties = [].obs;
  RxInt buttonIndex = 0.obs;
  RxString userId = ''.obs;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userEmail = ''.obs;
  RxString buyRentButton = ''.obs;
  RxString propertyType = ''.obs;
  RxList filteredPropertiesItems = [].obs;
  RxList featuredPropertiesItems = [].obs;

  Future fetchUserData(userId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId.value)
        .get();

    userName.value = documentSnapshot['name'];
    userImage.value = documentSnapshot['profilePic'];
    userEmail.value = documentSnapshot['email'];
  }

  changeLanguage(lang) {}

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

  // create a function to show the result of the filters and send it to filtered properties page
  Future filterProperties({
    String? propertyType,
    String? buyRentButton,
  }) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('properties')
        .where('type', isEqualTo: propertyType)
        .where('category', isEqualTo: buyRentButton)
        .get();
    filteredPropertiesItems.value = querySnapshot.docs;
    if (filteredPropertiesItems.length == 0) {
      Get.snackbar('No Properties Found', 'Please try again',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.toNamed('/filtered-properties', arguments: filteredPropertiesItems);
  }

  Future fetchFeaturedProperties() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('properties')
        .where('vip', isEqualTo: true)
        .get();
    featuredPropertiesItems.value = querySnapshot.docs;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await fetchProperties();
    await fetchFeaturedProperties();
    User? user = await FirebaseAuth.instance.currentUser;
    userId.value = user!.uid;
    await fetchUserData(userId);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/home');
  }
}
