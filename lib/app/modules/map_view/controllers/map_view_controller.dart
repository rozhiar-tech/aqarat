import 'dart:async';
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
  Rx<BitmapDescriptor> customIcon = BitmapDescriptor.defaultMarker.obs;
  Completer<GoogleMapController> mapController = Completer();
  Rx<Uint8List> markerIcon = Uint8List(0).obs;

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

  final count = 0.obs;
  @override
  void onInit() {
    getMarkerIcon();
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
