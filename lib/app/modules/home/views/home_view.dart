import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
          init: HomeController(),
          builder: (controller) {
            return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(110),
                  child: AppBar(
                      title: Text(
                        controller.title.value,
                        style: const TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              controller.userImage.value == ''
                                  ? 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'
                                  : controller.userImage.value,
                            ),
                          ),
                        ),
                      ],
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: const IconThemeData(
                        color: AppColors.greenColor,
                      )),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: AppColors.goldColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Aqarat',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 24,
                                      fontFamily: GoogleFonts.robotoCondensed()
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
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      controller.userImage.value == ''
                                          ? 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'
                                          : controller.userImage.value,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.userName.value,
                                    style: GoogleFonts.robotoCondensed(
                                      color: AppColors.greenColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.userEmail.value,
                                style: GoogleFonts.robotoCondensed(
                                  color: AppColors.greenColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              Ionicons.language_outline,
                              color: AppColors.greenColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Language',
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Change Language',
                            content: Column(
                              children: [
                                ListTile(
                                  title: const Text('English'),
                                  onTap: () {
                                    // controller.changeLanguage('en');
                                    Get.back();
                                  },
                                ),
                                ListTile(
                                  title: const Text('Arabic'),
                                  onTap: () {
                                    // controller.changeLanguage('ar');
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              Ionicons.log_out_outline,
                              color: AppColors.greenColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          controller.logout();
                        },
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: SizedBox(
                  height: Get.height * 0.1,
                  width: Get.width,
                  child: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Ionicons.home),
                        label: 'Home',
                        backgroundColor: Colors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Ionicons.chatbubbles_outline),
                        label: 'Chats',
                        backgroundColor: Colors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Ionicons.heart_circle),
                        label: 'Favorites',
                        backgroundColor: Colors.white,
                      ),
                    ],
                    currentIndex: 0,
                    selectedItemColor: AppColors.greenColor,
                    onTap: (index) {
                      controller.changeIndex(index);
                    },
                  ),
                ),
                backgroundColor: Colors.white,
                body: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Welcome to Aqarat Lets find your dream home',
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.robotoCondensed().fontFamily,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 39, top: 8),
                              child: Container(
                                height: Get.height * 0.07,
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  color: AppColors.goldColor,
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
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isPressedChange();
                                      if (controller.isPressed.value) {
                                        controller.buyRentButton('Buy');
                                        print(controller.buyRentButton.value);
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      height: Get.height * 0.1,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        color: controller.isPressed.value
                                            ? AppColors.greenColor
                                            : AppColors.goldColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text('Buy',
                                            style: TextStyle(
                                              color: controller.isPressed.value
                                                  ? AppColors.goldColor
                                                  : AppColors.greenColor,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 18,
                                            )),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.isPressedChange();
                                      if (!controller.isPressed.value) {
                                        controller.buyRentButton('Rent');
                                        print(controller.buyRentButton.value);
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(microseconds: 300),
                                      height: Get.height * 0.1,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        color: controller.isPressed.value
                                            ? AppColors.goldColor
                                            : AppColors.greenColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Rent',
                                          style: TextStyle(
                                            color: controller.isPressed.value
                                                ? AppColors.greenColor
                                                : AppColors.goldColor,
                                            fontFamily:
                                                GoogleFonts.robotoCondensed()
                                                    .fontFamily,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24, top: 10),
                              child: Container(
                                height: Get.height * 0.07,
                                width: Get.width * 0.9,
                                decoration: BoxDecoration(
                                  color: AppColors.goldColor,
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
                                    GestureDetector(
                                      onTap: () {
                                        controller.buttonIndexChange(0);
                                        controller.propertyType('Residential');
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height: Get.height * 0.09,
                                        width: Get.width * 0.3,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.buttonIndex.value == 0
                                                  ? AppColors.greenColor
                                                  : AppColors.goldColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text('Residential',
                                              style: TextStyle(
                                                color: controller.buttonIndex
                                                            .value ==
                                                        0
                                                    ? AppColors.goldColor
                                                    : AppColors.greenColor,
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.buttonIndexChange(1);
                                        controller.propertyType('Commercial');
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height: Get.height * 0.09,
                                        width: Get.width * 0.3,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.buttonIndex.value == 1
                                                  ? AppColors.greenColor
                                                  : AppColors.goldColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Commercial',
                                            style: TextStyle(
                                              color: controller
                                                          .buttonIndex.value ==
                                                      1
                                                  ? AppColors.goldColor
                                                  : AppColors.greenColor,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.buttonIndexChange(2);
                                        controller.propertyType('Tourism');
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height: Get.height * 0.09,
                                        width: Get.width * 0.3,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.buttonIndex.value == 2
                                                  ? AppColors.greenColor
                                                  : AppColors.goldColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Tourism',
                                            style: TextStyle(
                                              color: controller
                                                          .buttonIndex.value ==
                                                      2
                                                  ? AppColors.goldColor
                                                  : AppColors.greenColor,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24, top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.filterProperties(
                                      buyRentButton:
                                          controller.buyRentButton.value,
                                      propertyType:
                                          controller.propertyType.value);
                                },
                                child: Text(
                                  'Show Results',
                                  style: TextStyle(
                                    color: AppColors.goldColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.robotoCondensed()
                                        .fontFamily,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize:
                                      Size(Get.width * 0.9, Get.height * 0.07),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Featured Properties',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/feautured-properties',
                                          arguments: controller
                                              .featuredPropertiesItems);
                                    },
                                    child: Text(
                                      'View All',
                                      style: TextStyle(
                                        color: AppColors.greenColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.robotoCondensed()
                                                .fontFamily,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.5,
                              width: Get.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.featuredPropertiesItems.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/single-property',
                                                arguments: [
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['photos'] as List,
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['price'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['type'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['location'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['description'],
                                                ]);
                                          },
                                          child: Container(
                                            height: Get.height * 0.4,
                                            width: Get.width * 0.5,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: Get.height * 0.3,
                                                  width: Get.width * 0.5,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        controller
                                                                .featuredPropertiesItems[
                                                            index]['photos'][0],
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Container(
                                                    height: Get.height * 0.1,
                                                    width: Get.width * 0.5,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .featuredPropertiesItems[
                                                                  index]
                                                                  ['price']
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .greenColor,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: GoogleFonts
                                                                    .robotoCondensed()
                                                                .fontFamily,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .featuredPropertiesItems[
                                                              index]['category'],
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .greenColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: GoogleFonts
                                                                    .robotoCondensed()
                                                                .fontFamily,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .featuredPropertiesItems[
                                                              index]['type'],
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .greenColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: GoogleFonts
                                                                    .robotoCondensed()
                                                                .fontFamily,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'New Properties',
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.robotoCondensed().fontFamily,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.4,
                              width: Get.width,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: controller.properties.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/single-property',
                                                arguments: [
                                                  controller.properties[index]
                                                      ['photos'] as List,
                                                  controller.properties[index]
                                                      ['price'],
                                                  controller.properties[index]
                                                      ['type'],
                                                  controller.properties[index]
                                                      ['location'],
                                                  controller.properties[index]
                                                      ['description'],
                                                ]);
                                          },
                                          child: Container(
                                            height: Get.height * 0.33,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
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
                                                  width: Get.width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          controller.properties[
                                                                  index]
                                                              ['photos'][0]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Ionicons
                                                                .cash_outline,
                                                            color: AppColors
                                                                .greenColor,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            controller
                                                                .properties[
                                                                    index]
                                                                    ['price']
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .greenColor,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily: GoogleFonts
                                                                      .robotoCondensed()
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
                                                            Ionicons
                                                                .home_outline,
                                                            color: AppColors
                                                                .greenColor,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            controller
                                                                    .properties[
                                                                index]['type'],
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .greenColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily: GoogleFonts
                                                                      .robotoCondensed()
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
                                                            Ionicons
                                                                .location_outline,
                                                            color: AppColors
                                                                .greenColor,
                                                          ),
                                                          Text(
                                                            controller.properties[
                                                                    index]
                                                                ['location'],
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .greenColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily: GoogleFonts
                                                                      .robotoCondensed()
                                                                  .fontFamily,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height:
                                                            Get.height * 0.13,
                                                        width: Get.width * 0.4,
                                                        child: Text(
                                                          controller
                                                              .properties[index]
                                                                  [
                                                                  'description']
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .greenColor,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: GoogleFonts
                                                                    .robotoCondensed()
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
