import 'package:aqarat/app/modules/single_property/views/single_property_view.dart';
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
            body: Container(
              height: Get.height,
              width: Get.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(35.5558, 45.4351),
                  zoom: 14.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(35.554480, 45.435876),
                    infoWindow: InfoWindow(title: 'Marker 1'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                    onTap: () {
                      Get.dialog(SinglePropertyView());
                    },
                  ),
                  Marker(
                    markerId: MarkerId('2'),
                    position: LatLng(35.554652, 45.428541),
                    infoWindow: InfoWindow(title: 'Marker 2'),
                  ),
                  Marker(
                    markerId: MarkerId('3'),
                    position: LatLng(35.555418, 45.446991),
                    infoWindow: InfoWindow(
                      title: 'Marker 3',
                    ),
                  ),
                },
                circles: {
                  Circle(
                    circleId: CircleId('1'),
                    center: LatLng(35.554480, 45.435876),
                    radius: 100,
                    fillColor: Colors.green.withOpacity(0.5),
                    strokeColor: Colors.green,
                    strokeWidth: 2,
                  ),
                  Circle(
                    circleId: CircleId('2'),
                    center: LatLng(35.554652, 45.428541),
                    radius: 100,
                    fillColor: Colors.green.withOpacity(0.5),
                    strokeColor: Colors.green,
                    strokeWidth: 2,
                  ),
                  Circle(
                    circleId: CircleId('3'),
                    center: LatLng(35.555418, 45.446991),
                    radius: 100,
                    fillColor: Colors.green.withOpacity(0.5),
                    strokeColor: Colors.green,
                    strokeWidth: 2,
                  ),
                },
                mapType: MapType.hybrid,
              ),
            ),
          );
        });
  }
}
