import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/feautured_properties_controller.dart';

class FeauturedPropertiesView extends GetView<FeauturedPropertiesController> {
  const FeauturedPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: FeauturedPropertiesController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  controller.title.value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenColor,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.greenColor,
                  ),
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.white,
              body: Container(
                height: Get.height,
                width: Get.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.feauturedPropertiesItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/single-property', arguments: [
                                controller.feauturedPropertiesItems[index]
                                    ['photos'] as List,
                                controller.feauturedPropertiesItems[index]
                                    ['price'],
                                controller.feauturedPropertiesItems[index]
                                    ['type'],
                                controller.feauturedPropertiesItems[index]
                                    ['location'],
                                controller.feauturedPropertiesItems[index]
                                    ['description'],
                              ]);
                            },
                            child: Container(
                              height: Get.height * 0.33,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: Get.height * 0.33,
                                    width: Get.width * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(controller
                                                .feauturedPropertiesItems[index]
                                            ['photos'][0]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Ionicons.cash_outline,
                                              color: AppColors.greenColor,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              controller
                                                  .feauturedPropertiesItems[
                                                      index]['price']
                                                  .toString(),
                                              style: TextStyle(
                                                color: AppColors.greenColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Ionicons.home_outline,
                                              color: AppColors.greenColor,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              controller
                                                      .feauturedPropertiesItems[
                                                  index]['type'],
                                              style: TextStyle(
                                                color: AppColors.greenColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Ionicons.location_outline,
                                              color: AppColors.greenColor,
                                            ),
                                            Text(
                                              controller
                                                      .feauturedPropertiesItems[
                                                  index]['location'],
                                              style: TextStyle(
                                                color: AppColors.greenColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.13,
                                          width: Get.width * 0.4,
                                          child: Text(
                                            controller
                                                .feauturedPropertiesItems[index]
                                                    ['description']
                                                .toString(),
                                            style: TextStyle(
                                              color: AppColors.greenColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ));
        });
  }
}
