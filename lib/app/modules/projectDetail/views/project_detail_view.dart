import 'package:aqarat/app/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/project_detail_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ProjectDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.sharedLang.value == 'Arabic'
                  ? controller.arabicTitle.value
                  : controller.sharedLang.value == 'Arabic_EG'
                      ? controller.kurdishTitle.value
                      : controller.title.value,
              style: const TextStyle(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: CarouselSlider(
                  carouselController: controller.carouselController,
                  items: [
                    for (var i = 0; i < controller.images.length; i++)
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.images[i],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                  options: CarouselOptions(
                    height: Get.height * 0.4,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    onPageChanged: (index, reason) => {
                      controller.selectedImageIndex.value = index,
                     
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   left: Get.width * 0.05,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: controller.images.asMap().entries.map((entry) {
              //       return GestureDetector(
              //         onTap: () => controller.carouselController
              //             .animateToPage(entry.key),
              //         child: Container(
              //           width: Get.height * 0.04,
              //           height: Get.height * 0.004,
              //           margin: const EdgeInsets.symmetric(
              //               vertical: 14.0, horizontal: 4.0),
              //           decoration: BoxDecoration(
              //               shape: BoxShape.rectangle,
              //               color: (Theme.of(context).brightness ==
              //                           Brightness.dark
              //                       ? Colors.white
              //                       : Colors.white)
              //                   .withOpacity(
              //                       controller.selectedImageIndex == entry.key
              //                           ? 0.9
              //                           : 0.4),
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //       );
              //     }).toList(),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.name.value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 5),
                    Text(
                      controller.location.value,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.grass),
                    const SizedBox(width: 5),
                    Text(
                      controller.grassArea.value.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 5),
                    Text(
                      controller.client.value,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.description.value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(
                        controller.images[0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.launchURL(controller.videoUrl.value);
                      },
                      child: Container(
                        width: Get.width * 0.2,
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: AppColors.goldColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                 Container(
                      decoration: BoxDecoration(
                        color:  Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: Get.height * 0.3,
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GoogleMap(
                          padding: const EdgeInsets.all(3),
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(controller.latitude.value,
                                controller.longitude.value),
                            zoom: 14.4746,
                          ),
                          markers: {
                            Marker(
                                markerId: const MarkerId('1'),
                                position: LatLng(controller.latitude.value,
                                    controller.longitude.value),
                                icon: controller.customIcon.value,
                                infoWindow: const InfoWindow(
                                    title: 'Property Location',
                                    snippet: '5 Star Rating'))
                          },
                          circles: {
                            Circle(
                                circleId: const CircleId('1'),
                                center: LatLng(controller.latitude.value,
                                    controller.longitude.value),
                                radius: 500,
                                fillColor: Colors.blue.withOpacity(0.2),
                                strokeColor: Colors.blue,
                                strokeWidth: 2,
                                onTap: () {
                                  print('Circle tapped');
                                },
                                consumeTapEvents: true,
                                visible: true)
                          },
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
