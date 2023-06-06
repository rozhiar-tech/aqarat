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
                        style: TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/happy-47972.appspot.com/o/pro.jpg?alt=media&token=e56be66f-aea0-494a-b260-8ddc3e2a3557&_gl=1*176jevk*_ga*MTAzODkwODYxNS4xNjY4OTQ5NDIz*_ga_CW55HF8NVT*MTY4NTg2ODUwOS4yMC4xLjE2ODU4Njg1MjcuMC4wLjA.',
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
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: AppColors.goldColor,
                        ),
                        child: Text(
                          'Drawer Header',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Item 1'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: const Text('Item 2'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
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
                        label: 'Business',
                        backgroundColor: Colors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Ionicons.heart_circle),
                        label: 'School',
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
                body: Container(
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
                                  fontSize: 22,
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
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(microseconds: 500),
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
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
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
                                          child: Text('Appartments',
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
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
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
                                            'Houses',
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
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
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
                                            'Villas',
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
                              padding: EdgeInsets.only(left: 24, top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed('/search');
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
                                  Text(
                                    'View All',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
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
                                itemCount: 12,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: Get.height * 0.4,
                                          width: Get.width * 0.5,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
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
                                                    image: AssetImage(
                                                        'assets/house.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                                        '12,00 USD',
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
                                                        'House',
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
                                                        'Rent',
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
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'New Properties',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'View All',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
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
                                itemCount: controller.properties.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: Get.height * 0.4,
                                          width: Get.width * 0.5,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
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
                                                              .properties[index]
                                                          ['photo'],
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                                            .properties[index]
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
                                                        controller.properties[
                                                            index]['type'],
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
                                                        controller.properties[
                                                            index]['category'],
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
