import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SinglePropertyController extends GetxController {
  //TODO: Implement SinglePropertyController
  RxString title = 'Property Details'.obs;
  RxBool isFavourite = false.obs;
  RxInt selectedImageIndex = 0.obs;
  RxList images = [].obs;
  RxString description = ''.obs;
  RxString price = ''.obs;
  RxString address = ''.obs;
  RxString propertyType = ''.obs;
  RxString userId = ''.obs;

  CarouselController carouselController = CarouselController();

  retrieveArguments() {
    final arguments = Get.arguments;
    images.value = arguments[0];
    price.value = arguments[1].toString();
    propertyType.value = arguments[2];
    address.value = arguments[3];
    description.value = arguments[4];
  }

  isFavouriteToggle() {
    isFavourite.value = !isFavourite.value;
  }

  // create a function to combine the id we got from arguments and the current user id
  Future createChatRoom() async {
    String chatRoomId = '${userId.value}-xA5lRs5krEa3LKEeVhvT';
    print(chatRoomId);
    // create a map to store the chatroom id and the users id
    Map<String, dynamic> chatRoomMap = {
      'users': [userId.value, "xA5lRs5krEa3LKEeVhvT"]
    };
    // create a chatroom with the chatroom id and the map we created
    await FirebaseFirestore.instance
        .collection('chatrooms')
        .doc(chatRoomId)
        .set(chatRoomMap)
        .then((value) {
      Get.toNamed('/chat', arguments: chatRoomId);
    });
  }

  // create a function to check if the user is looged in or not with firebase
  Future checkIfUserIsLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId.value = user.uid;
      createChatRoom();
    } else {
      Get.toNamed('/login');
    }
  }

  // create a function to favorite a property
  Future favoriteProperty() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (isFavourite.value == true) {
        Get.snackbar(
          'Error',
          'Property already added to favorites',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      userId.value = user.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId.value)
          .collection('favorites')
          .doc()
          .set({
        'images': images.value,
        'price': price.value,
        'propertyType': propertyType.value,
        'address': address.value,
        'description': description.value,
      }).then((value) {
        Get.snackbar(
          'Success',
          'Property added to favorites',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      });
    } else {
      Get.toNamed('/login');
    }
  }

  Future checkIfPropertyIsFavorite() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId.value = user.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId.value)
          .collection('favorites')
          .where('address', isEqualTo: address.value)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          isFavourite.value = true;
        }
      });
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    retrieveArguments();
    checkIfPropertyIsFavorite();
    print('images: $price');
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
