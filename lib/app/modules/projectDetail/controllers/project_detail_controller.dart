import 'dart:typed_data';
import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailController extends GetxController {
  //TODO: Implement ProjectDetailController
  RxString title = 'Details'.obs;
  RxString kurdishTitle = 'وردەکاری'.obs;
  RxString arabicTitle = 'تفاصيل'.obs;
  RxString description = ''.obs;
  RxString name = ''.obs;
  RxList images = [].obs;
  RxString location = ''.obs;
  RxString grassArea = ''.obs;
  RxString client = ''.obs;
  RxInt selectedImageIndex = 0.obs;
  RxString videoUrl = ''.obs;
  RxString sharedLang = 'English'.obs;
  RxString id = ''.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Rx<BitmapDescriptor> customIcon = BitmapDescriptor.defaultMarker.obs;

  CarouselController carouselController = CarouselController();

  retrieveArguments() {
    final arguments = Get.arguments;

    name.value = arguments[0];
    description.value = arguments[1];
    location.value = arguments[2];
    grassArea.value = arguments[3].toString();
    client.value = arguments[4];
    images.value = arguments[5];
    videoUrl.value = arguments[6];
    latitude.value = arguments[7];
    longitude.value = arguments[8];
  }

  Future getBytesFromAsset(String path, int width) async {
    final data = await rootBundle.load(path);
    final codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final frameInfo = await codec.getNextFrame();
    final image = await frameInfo.image.toByteData(format: ImageByteFormat.png);
    return image!.buffer.asUint8List();
  }

  Future getMarkerIcon() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/marker.png', 100);
    customIcon.value = BitmapDescriptor.fromBytes(markerIcon);
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
    retrieveArguments();
    getMarkerIcon();

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
