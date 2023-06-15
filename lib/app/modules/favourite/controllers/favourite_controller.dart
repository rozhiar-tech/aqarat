import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteController extends GetxController {
  //TODO: Implement FavouriteController
  RxString title = 'Favourits'.obs;
  RxList favouriteList = [].obs;

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

  Future fetchFavouritProperties() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // don't allow duplicate favourites
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          favouriteList.add(element.data());
        });
      });
    }
  }

  final count = 0.obs;
  @override
  void onInit() async {
    
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await fetchFavouritProperties();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
