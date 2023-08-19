import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/single_property_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SinglePropertyView extends GetView<SinglePropertyController> {
  const SinglePropertyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: SinglePropertyController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              bottomNavigationBar: Container(
                height: Get.height * 0.1,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/happy-47972.appspot.com/o/pro.jpg?alt=media&token=e56be66f-aea0-494a-b260-8ddc3e2a3557&_gl=1*176jevk*_ga*MTAzODkwODYxNS4xNjY4OTQ5NDIz*_ga_CW55HF8NVT*MTY4NTg2ODUwOS4yMC4xLjE2ODU4Njg1MjcuMC4wLjA.',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yaho',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.withOpacity(0.5),
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Real Estate Agent',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenColor,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          await controller.checkIfUserIsLoggedIn();
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.black.withOpacity(0.1),
                          child: Icon(
                            Ionicons.chatbox_ellipses_outline,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                child: Container(
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: CarouselSlider(
                                carouselController:
                                    controller.carouselController,
                                items: [
                                  for (var i = 0;
                                      i < controller.images.length;
                                      i++)
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
                                    print(controller.selectedImageIndex.value)
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: Get.width * 0.05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.images
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () => controller.carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: Get.height * 0.04,
                                      height: Get.height * 0.004,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 14.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.white)
                                              .withOpacity(controller
                                                          .selectedImageIndex ==
                                                      entry.key
                                                  ? 0.9
                                                  : 0.4),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),

                            Positioned(
                              top: Get.height * 0.02,
                              left: Get.width * 0.05,
                              child: Container(
                                height: Get.height * 0.07,
                                width: Get.width * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Ionicons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            // Text(controller.title.value)

                            Positioned(
                              top: Get.height * 0.02,
                              right: Get.width * 0.05,
                              child: Container(
                                height: Get.height * 0.07,
                                width: Get.width * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    await controller.favoriteProperty();
                                    controller.isFavouriteToggle();
                                  },
                                  icon: Icon(
                                    Ionicons.heart,
                                    color: controller.isFavourite.value
                                        ? Colors.red
                                        : Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.09,
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$${controller.price.value} -',
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? Colors.white
                                              : AppColors.greenColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.02,
                                    ),
                                    Text(
                                      '\$${controller.price.value} ',
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? Colors.white
                                              : AppColors.greenColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  controller.address.value,
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? Colors.white
                                          : AppColors.greenColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // create a line here to seperate the price and address from the description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width,
                            child: Text(
                              controller.description.value,
                              style: TextStyle(
                                  color: controller.isDarkMode.value
                                      ? Colors.white
                                      : Colors.grey[400],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Features",
                            style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? Colors.white
                                    : AppColors.greenColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Ionicons.bed_outline,
                                color: controller.isDarkMode.value
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                ": Bedrooms",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(controller.bedrooms.value),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.001,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.aspect_ratio_outlined,
                                color: controller.isDarkMode.value
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                ": Area",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text("${controller.area.value} m2"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.001,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bathtub_rounded,
                                color: controller.isDarkMode.value
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                ": Bathrooms",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(controller.bathrooms.value),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.001,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.open_with_outlined,
                                color: controller.isDarkMode.value
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                ": Facing",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(controller.rwgasore.value),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.001,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.other_houses_outlined,
                                color: controller.isDarkMode.value
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                ": Rooms",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(controller.rooms.value),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
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
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 50,
                                  color: AppColors.goldColor,
                                ),
                              ),
                            )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: controller.isDarkMode.value
                                ? AppColors.blackColor
                                : Colors.white,
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
                                    markerId: MarkerId('1'),
                                    position: LatLng(controller.latitude.value,
                                        controller.longitude.value),
                                    icon: controller.customIcon.value,
                                    infoWindow: InfoWindow(
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
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
