import 'package:aqarat/app/modules/single_property/views/single_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
                onMapCreated: (GoogleMapController) {
                  controller.mapController.complete();
                },
                markers: {
                  Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(35.554480, 45.435876),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CustomInfoWindow(
                            title: 'House',
                            imagePath: 'assets/house.jpg',
                          );
                        },
                      );
                    },
                    icon: controller.customIcon.value,
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

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String imagePath;

  CustomInfoWindow({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Additional information goes here',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
