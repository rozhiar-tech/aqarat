import 'dart:ui';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExchangeRateController extends GetxController {
  RxString iqd = ''.obs;
  RxString euro = ''.obs;
  RxString pound = ''.obs;
  RxString sharedLang = 'English'.obs;

  final count = 0.obs;
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
    // Retrieve data from Firestore when the controller is initialized
    fetchCurrencies();
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

  Future<void> fetchCurrencies() async {
    try {
      // Access the Firestore instance and get the document snapshot
      DocumentSnapshot currencySnapshot = await FirebaseFirestore.instance
          .collection('Currencies')
          .doc('RiSmdb6wrI5ZujXOb4AP')
          .get();

      // Extract values from the snapshot
      Map<String, dynamic>? data =
          currencySnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        // Assign retrieved values to the variables
        iqd.value = data['IQD']; // Replace with the actual field names
        euro.value = data['EURO'];
        pound.value = data['POUND'];
      }
    } catch (e) {
      // Handle any potential errors
      print('Error fetching currencies: $e');
    }
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
