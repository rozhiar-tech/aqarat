
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: FavouriteController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                title: Text(
                  controller.title.value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
                elevation: 0,
                centerTitle: true,
              ),
              body: SizedBox(
                height: Get.height,
                width: Get.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.favouriteList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/single-property', arguments: [
                                controller.favouriteList[index]['images']
                                    as List,
                                controller.favouriteList[index]['price'],
                                controller.favouriteList[index]['type'],
                                controller.favouriteList[index]['address'],
                                controller.favouriteList[index]['description'],
                                controller.favouriteList[index]['area'],
                                controller.favouriteList[index]['bedrooms'],
                                controller.favouriteList[index]['bathrooms'],
                                controller.favouriteList[index]['floors'],
                                controller.favouriteList[index]['rooms'],
                                controller.favouriteList[index]['rwgasore'],
                                controller.isDarkMode.value,
                                controller.favouriteList[index]['latitude'],
                                controller.favouriteList[index]['longitude'],
                                controller.favouriteList[index]['videoUrl'],
                                controller.favouriteList[index]['id'],
                                controller.favouriteList,
                              ]);
                            },
                            child: Container(
                              height: Get.height * 0.33,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
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
                                            .favouriteList[index]['images'][0]),
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
                                            Icon(
                                              Ionicons.cash_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              controller.favouriteList[index]
                                                      ['price']
                                                  .toString(),
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
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
                                            Icon(
                                              Ionicons.home_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              controller.favouriteList[index]
                                                  ['propertyType'],
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
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
                                            Icon(
                                              Ionicons.location_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            Text(
                                              controller.favouriteList[index]
                                                  ['address'],
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
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
                                            controller.favouriteList[index]
                                                    ['description']
                                                .toString(),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
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
