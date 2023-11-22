import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapViewController extends GetxController {
  RxInt id = 0.obs;
  //TODO: Implement MapViewController
  RxString title = "Map".obs;
  //AIzaSyAiESKBGKRG7WQh56agYhoZk3971yu2Vyo
  RxSet<Marker> markers = <Marker>{}.obs;
  Rx<BitmapDescriptor> customIcon = BitmapDescriptor.defaultMarker.obs;
  Completer<GoogleMapController> mapController = Completer();
  Rx<Uint8List> markerIcon = Uint8List(0).obs;
  RxList markerList = [].obs;
  RxList locationList = [].obs;
  RxList circles = [].obs;
  RxList selectedProperty = [].obs;
  RxBool isInfoWindowShown = false.obs;

  Future<void> getPropertiesFromFirebase(double latitude) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('properties')
        .where('latitude', isEqualTo: latitude)
        .get();
    selectedProperty.value = querySnapshot.docs;
    print('property found');
  }

  Future<void> getLocationsFromFirebase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('propertyLocations').get();
    locationList.value = querySnapshot.docs;

    for (var location in locationList) {
      List<dynamic> property = location['property'];
      double latitude = property[0];
      double longitude = property[1];

      // Fetch properties from 'properties' collection with the same location

      Marker marker = Marker(
        markerId: MarkerId(location.id),
        position: LatLng(latitude, longitude),
        icon: customIcon.value,
        onTap: () {
          isInfoWindowShown.value = true;
          getPropertiesFromFirebase(property[0]);
        },
      );
      markers.add(marker);
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

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getMarkerIcon();
    await getLocationsFromFirebase();
    print(selectedProperty);
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
