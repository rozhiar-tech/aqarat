import 'dart:ffi';
import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

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
  RxString bedrooms = ''.obs;
  RxString bathrooms = ''.obs;
  RxString floors = ''.obs;
  RxString area = ''.obs;
  RxString rooms = ''.obs;
  RxString rwgasore = ''.obs;
  RxString propertyId = ''.obs;
  RxString userId = ''.obs;
  RxBool isDarkMode = false.obs;
  RxString message = ''.obs;
  RxString whatsAppUrl = "".obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString videoUrl = ''.obs;
  Rx<BitmapDescriptor> customIcon = BitmapDescriptor.defaultMarker.obs;
  RxString sharedLang = 'English'.obs;
  RxString countryCode = ''.obs;
  RxString id = ''.obs;
  RxList properties = [].obs;
  RxList similarProperties = [].obs;

  CarouselController carouselController = CarouselController();

  retrieveArguments() {
    final arguments = Get.arguments;
    images.value = arguments[0];
    price.value = arguments[1].toString();
    propertyType.value = arguments[2];
    address.value = arguments[3];
    description.value = arguments[4];
    area.value = arguments[5].toString();
    bedrooms.value = arguments[6].toString();
    bathrooms.value = arguments[7].toString();
    floors.value = arguments[8].toString();
    rooms.value = arguments[9].toString();
    rwgasore.value = arguments[10].toString();
    isDarkMode.value = arguments[11];
    latitude.value = arguments[12];
    longitude.value = arguments[13];
    videoUrl.value = arguments[14];
    id.value = arguments[15].toString();
    properties.value = arguments[16];
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  isFavouriteToggle() {
    isFavourite.value = !isFavourite.value;
  }

  // create a function to combine the id we got from arguments and the current user id
  Future createChatRoom() async {
    // if chatroom is already created, then go to chatroom
    await FirebaseFirestore.instance
        .collection('chatrooms')
        .where('users', arrayContains: userId.value)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        Get.toNamed('/chat', arguments: value.docs[0].id);
        return;
      }
    });
    // create a chatroom id
    String chatRoomId = '${userId.value}-xA5lRs5krEa3LKEeVhvT';
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
      // createChatRoom();
    } else {
      Get.toNamed('/login');
    }
  }

  launchWhatsApp() async {
    message.value =
        "Hello, I'm interested in your property,${address.value}, ${propertyType.value}, ${price.value} ${images[0]}";
    whatsAppUrl.value = "whatsapp://send?phone=+9647501501212&text=$message";
    await launchUrl(Uri.parse(whatsAppUrl.value));
  }

  // create a function to favorite a property
  Future favoriteProperty() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (isFavourite.value == true) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId.value)
            .collection('favorites')
            .where('images', isEqualTo: images.value)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            element.reference.delete();
          });
        });
        isFavourite.value = true;
        Get.snackbar(
          'Error',
          'Property removed from favorites',
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
        'propertyId': propertyId.value,
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

  changeLanguage(lang, {countryCode = ''}) {
    Get.updateLocale(Locale(lang));
    SharedPreferences.getInstance().then((prefs) {
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
    });
  }

  List<Map<String, dynamic>> fetchSimilarProperties(double targetPrice) {
    return properties
        .where((property) {
          double propertyPrice = 4000.0;
          return (propertyPrice >= targetPrice - 10000) &&
              (propertyPrice <= targetPrice + 10000);
        })
        .map((property) => property.data() as Map<String, dynamic>)
        .toList();
  }

  void setSimilarProperties(List<Map<String, dynamic>> properties) {
    similarProperties.value = properties;
  }

  void loadSimilarProperties() {
    double targetPrice = 4000.0; // Assuming price is a double
    setSimilarProperties(fetchSimilarProperties(targetPrice));
  }

  void showSimilarProperty(int index) {
    // Update property details in the controller
    images.value = similarProperties[index]['photos'];
    price.value = similarProperties[index]['price'];
    propertyType.value = similarProperties[index]['type'];
    address.value = similarProperties[index]['address'];
    description.value = similarProperties[index]['description'];
    area.value = similarProperties[index]['area'];
    bedrooms.value = similarProperties[index]['bedrooms'];
    bathrooms.value = similarProperties[index]['bathrooms'];
    floors.value = similarProperties[index]['floors'];
    rooms.value = similarProperties[index]['rooms'];
    rwgasore.value = similarProperties[index]['rwgasore'];
    id.value = similarProperties[index]['id'];
    latitude.value = similarProperties[index]['latitude'];
    longitude.value = similarProperties[index]['longtitude'];
    videoUrl.value = similarProperties[index]['videoUrl'];

    // If you have any UI elements that rely on these properties,
    // they will automatically update due to reactive programming.
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    retrieveArguments();
    getMarkerIcon();

    loadSimilarProperties();
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
    checkIfPropertyIsFavorite();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
