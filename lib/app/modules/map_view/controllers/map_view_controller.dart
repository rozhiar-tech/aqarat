import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController {
  //TODO: Implement MapViewController
  RxString title = "Map".obs;
  //AIzaSyAiESKBGKRG7WQh56agYhoZk3971yu2Vyo
  RxSet<Marker> markers = <Marker>{}.obs;
  BitmapDescriptor? customIcon;

  

  final count = 0.obs;
  @override
  void onInit() {
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
