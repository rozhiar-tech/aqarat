import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../../theme/app_colors.dart';
import '../controllers/filtered_properties_controller.dart';

class FilteredPropertiesView extends GetView<FilteredPropertiesController> {
  const FilteredPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: FilteredPropertiesController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.title.value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.robotoCondensed().fontFamily,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Ionicons.chevron_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.filteredPropertiesItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/single-property', arguments: [
                            controller.filteredPropertiesItems[index]['photos']
                                as List,
                            controller.filteredPropertiesItems[index]['price'],
                            controller.filteredPropertiesItems[index]['type'],
                            controller.filteredPropertiesItems[index]
                                ['location'],
                            controller.filteredPropertiesItems[index]
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
                                            .filteredPropertiesItems[index]
                                        ['photos'][0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Ionicons.cash_outline,
                                          color: AppColors.greenColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller
                                              .filteredPropertiesItems[index]
                                                  ['price']
                                              .toString(),
                                          style: TextStyle(
                                            color: AppColors.greenColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.robotoCondensed()
                                                    .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Ionicons.home_outline,
                                          color: AppColors.greenColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.filteredPropertiesItems[
                                              index]['type'],
                                          style: TextStyle(
                                            color: AppColors.greenColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.robotoCondensed()
                                                    .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Ionicons.location_outline,
                                          color: AppColors.greenColor,
                                        ),
                                        Text(
                                          controller.filteredPropertiesItems[
                                              index]['location'],
                                          style: TextStyle(
                                            color: AppColors.greenColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.robotoCondensed()
                                                    .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: Get.height * 0.13,
                                      width: Get.width * 0.4,
                                      child: Text(
                                        controller
                                            .filteredPropertiesItems[index]
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
          ),
        );
      },
    );
  }
}
