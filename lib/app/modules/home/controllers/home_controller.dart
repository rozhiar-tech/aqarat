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
  RxString buyRentButton = 'Residential'.obs;
  RxString propertyType = 'Buy'.obs;
  RxList filteredPropertiesItems = [].obs;
  RxList featuredPropertiesItems = [].obs;
  RxString sharedLang = 'English'.obs;
  RxString welcomeMessage = 'Welcome to Aqarat Lets find your dream home'.obs;
  RxBool isDarkMode = false.obs;
  RxBool isGrid = false.obs;
  RxString countryCodeValue = 'US'.obs;
  User? user = FirebaseAuth.instance.currentUser;

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
      print('Saving lang: $lang, countryCode: $countryCode');

      if (lang == 'ar' && countryCode == 'IQ') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'ar', countryCode: 'IQ'));
        prefs.setString('lang', 'Arabic');
        countryCodeValue.value = 'IQ';
      } else if (lang == 'ar' && countryCode == 'EG') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'));
        prefs.setString('lang', 'Arabic_EG');
        countryCodeValue.value = 'EG';
      } else if (lang == 'en') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'));
        prefs.setString('lang', 'English');
        countryCodeValue.value = 'US';
      }
    });
    SharedPreferences.getInstance().then((prefs) {
      sharedLang.value = prefs.getString('lang') ?? 'English';
      countryCodeValue.value = prefs.getString('countryCode') ?? 'US';
      // Use the retrieved language value
    });
  }

  printString() {
    print(sharedLang.value);
  }

  // create a function to show the result of the filters and send it to filtered properties page
  Future filterProperties({
    propertyType,
    buyRentButton,
  }) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('properties')
        .where('type', isEqualTo: propertyType)
        .where('category', isEqualTo: buyRentButton)
        .get();
    filteredPropertiesItems.value = querySnapshot.docs;
    if (filteredPropertiesItems.length == 0) {
      print("filter properties" + propertyType! + buyRentButton!);

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
    SharedPreferences.getInstance().then((prefs) {
      sharedLang.value = prefs.getString('lang') ?? 'English';
      changeLanguage(sharedLang.value, countryCode: "IQ");
      if (sharedLang.value == 'Arabic') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'ar', countryCode: 'IQ'));
      } else if (sharedLang.value == 'Arabic_EG') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'));
      } else if (sharedLang.value == 'English') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'));
      }
    });
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await fetchProperties();
    await fetchFeaturedProperties();
    User? user = await FirebaseAuth.instance.currentUser;
    userId.value = user!.uid;
    await fetchUserData(userId);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/dashboard');
  }
}
