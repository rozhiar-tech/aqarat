import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../theme/app_colors.dart';
import '../controllers/map_view_controller.dart';

class MapViewView extends GetView<MapViewController> {
  const MapViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;

    void moveToPropertyLocation(double latitude, double longitude) async {
      final GoogleMapController? controller =
          await this.controller.mapController.future;
      if (controller != null) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 16.0, // Set your desired zoom level
            ),
          ),
        );
      }
    }

    double latitude = 35.5558; // Default latitude
    double longitude = 45.4351; // Default longitude

    // Check if arguments are available and assign them
    if (arguments != null) {
      latitude = arguments['latitude'] ?? 35.5558;
      longitude = arguments['longitude'] ?? 45.4351;
      print(latitude);
    }
    return GetX<MapViewController>(
        init: MapViewController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                controller.title.value,
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: controller.locationList.length > 0
                      ? GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(latitude, longitude),
                            zoom: 12.0,
                          ),
                          markers: controller.markers,
                          mapType: MapType.hybrid,
                          onMapCreated: (GoogleMapController controller) {
                            this.controller.mapController.complete(controller);
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
                Visibility(
                  visible: controller.isInfoWindowShown.value,
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Property Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              if (controller.selectedProperty.isNotEmpty)
                                Image.network(
                                  controller.selectedProperty[0]['photos'][0],
                                  width: 100,
                                  height: 100,
                                ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.selectedProperty.isNotEmpty)
                                    Text(
                                      'Price: ${controller.selectedProperty[0]['price'].toString()}',
                                    ),
                                  const SizedBox(height: 10),
                                  if (controller.selectedProperty.isNotEmpty)
                                    Text(
                                      'Type: ${controller.selectedProperty[0]['type']}',
                                    ),
                                ],
                              )
                            ],
                          ),

                          // Add more property details here
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
