import 'package:aqarat/app/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
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
                        print(controller.selectedImageIndex.value)
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text(
                        controller.location.value,
                        style: TextStyle(
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
                      Icon(Icons.grass),
                      SizedBox(width: 5),
                      Text(
                        controller.grassArea.value.toString(),
                        style: TextStyle(
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
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text(
                        controller.client.value,
                        style: TextStyle(
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
                    style: TextStyle(
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
                        child: Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: AppColors.goldColor,
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
