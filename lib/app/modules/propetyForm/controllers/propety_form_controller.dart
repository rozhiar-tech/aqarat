import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropetyFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxString title = 'Property Request Form'.obs;

  RxString propertyName = ''.obs;
  RxDouble price = 0.0.obs;
  RxString location = ''.obs;
  RxString description = ''.obs;
  RxString phone = ''.obs;
  RxString sharedLang = 'English'.obs;

  Future<void> saveFormToFirebase() async {
    try {
      await FirebaseFirestore.instance.collection('propertyRequest').add({
        'propertyName': propertyName.value,
        'price': price.value,
        'location': location.value,
        'description': description.value,
        'phone': phone.value,
      });

      // Reset form fields after successful submission
      formKey.currentState!.reset();
      propertyName.value = '';
      price.value = 0.0;
      location.value = '';
      description.value = '';
      phone.value = '';
    } catch (e) {
      print('Error saving form data: $e');
    }
  }

  changeLanguage(lang, {countryCode = ''}) {
    Get.updateLocale(Locale(lang));
    SharedPreferences.getInstance().then((prefs) {
      if (lang == 'ar' && countryCode == 'IQ') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'ar', countryCode: 'IQ'));
        prefs.setString('lang', 'Arabic');
        countryCode.value = 'IQ';
      } else if (lang == 'ar' && countryCode == 'EG') {
        Get.updateLocale(
            const Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'));
        prefs.setString('lang', 'Arabic_EG');
        countryCode.value = 'EG';
      } else if (lang == 'en') {
        Get.updateLocale(const Locale('en', 'US'));
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
}
