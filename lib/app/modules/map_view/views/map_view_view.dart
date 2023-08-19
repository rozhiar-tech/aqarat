import 'package:aqarat/app/modules/single_property/views/single_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../widgets/customeinfo.dart';
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
              child: controller.locationList.length > 0
                  ? GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(35.5558, 45.4351),
                        zoom: 12.0,
                      ),
                      markers: controller.markers,
                      mapType: MapType.hybrid,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
  }
}
