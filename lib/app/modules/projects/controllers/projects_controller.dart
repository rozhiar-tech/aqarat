import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectsController extends GetxController {
  //TODO: Implement ProjectsController
  RxString title = 'Projects'.obs;
  RxString kurdishTitle = 'پڕۆژەکان'.obs;
  RxString arabicTitle = 'المشاريع'.obs;
  RxList projects = [].obs;
  RxString sharedLang = 'English'.obs;

  retrieveProjectsFromFirebase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('projects').get();
    projects.value = querySnapshot.docs;
  }

  changeLanguage(lang, {countryCode = ''}) {
    Get.updateLocale(Locale(lang));
    SharedPreferences.getInstance().then((prefs) {
      print(lang);
      if (lang == 'ar' && countryCode == 'IQ') {
        Get.updateLocale(
            Locale.fromSubtags(languageCode: 'ar', countryCode: 'IQ'));
        prefs.setString('lang', 'Arabic');
        countryCode.value = 'IQ';
      } else if (lang == 'ar' && countryCode == 'EG') {
        Get.updateLocale(
            Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'));
        prefs.setString('lang', 'Arabic_EG');
        countryCode.value = 'EG';
      } else if (lang == 'en') {
        Get.updateLocale(Locale('en', 'US'));
        prefs.setString('lang', 'English');
        countryCode.value = 'US';
      }
    });
    SharedPreferences.getInstance().then((prefs) {
      sharedLang.value = prefs.getString('lang') ?? 'English';
      // Use the retrieved language value
      print(sharedLang.value);
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    retrieveProjectsFromFirebase();
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
