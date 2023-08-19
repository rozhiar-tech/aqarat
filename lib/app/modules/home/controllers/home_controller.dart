import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString title = 'LS Aqarat'.obs;

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
  RxString sharedLang = 'English'.obs;
  RxString welcomeMessage = 'Welcome to Aqarat Lets find your dream home'.obs;
  RxBool isDarkMode = false.obs;
  RxBool isGrid = false.obs;

  toggleViewMode() {
    isGrid.value = !isGrid.value;
  }

  Future fetchUserData(userId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId.value)
        .get();

    userName.value = documentSnapshot['name'];
    userImage.value = documentSnapshot['profilePic'];
    userEmail.value = documentSnapshot['email'];
  }

  buttonIndexChange(int index) {
    buttonIndex.value = index;
  }

  isDarkModeChange() {
    isDarkMode.value = !isDarkMode.value;
  }

  isPressedChange() {
    isPressed.value = !isPressed.value;
  }

  Future fetchProperties() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('properties').get();
    properties.value = querySnapshot.docs;
  }

  //create a function to change the language of the app
  changeLanguage(lang, {countryCode = ''}) {
    Get.updateLocale(Locale(lang));
    SharedPreferences.getInstance().then((prefs) {
      print(lang);
      if (lang == 'ar' && countryCode == 'IQ') {
        Get.updateLocale(
            Locale.fromSubtags(languageCode: 'ar', countryCode: 'IQ'));
        prefs.setString('lang', 'Arabic');
      } else if (lang == 'ar' && countryCode == 'EG') {
        Get.updateLocale(
            Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'));
        prefs.setString('lang', 'Arabic_EG');
      } else if (lang == 'en') {
        Get.updateLocale(Locale('en', 'US'));
        prefs.setString('lang', 'English');
      }
    });
    SharedPreferences.getInstance().then((prefs) {
      sharedLang.value = prefs.getString('lang') ?? 'English';
      // Use the retrieved language value
      print(sharedLang.value);
    });
  }

  printString() {
    print(sharedLang.value);
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

  changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
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
