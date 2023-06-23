import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../L10n/l10n.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  preferredSize: const Size.fromHeight(90),
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
                          padding: const EdgeInsets.all(8.0),
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
                      backgroundColor: Theme.of(context).colorScheme.background,
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
                                    'LS Aqarat',
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
                              controller.sharedLang.value == 'Arabic'
                                  ? 'تغيير اللغة'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'گۆڕینی زمان'
                                      : 'Change Language',
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
                            title: controller.sharedLang.value == 'Arabic'
                                ? 'تغيير اللغة'
                                : controller.sharedLang.value == 'Arabic_EG'
                                    ? 'گۆڕینی زمان'
                                    : 'Change Language',
                            content: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    'English',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 16,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  onTap: () {
                                    controller.changeLanguage('en');
                                    Get.back();
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    'العربية',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 16,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  onTap: () {
                                    controller.changeLanguage('ar',
                                        countryCode: 'IQ');

                                    Get.back();
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    'کوردی',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 16,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  onTap: () {
                                    controller.changeLanguage('ar',
                                        countryCode: 'EG');
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
                              controller.sharedLang.value == 'Arabic'
                                  ? 'تسجيل الخروج'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'چوونە دەرەوە'
                                      : 'Logout',
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
                      ListTile(
                        title: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: 35,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300],
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isDarkModeChange();
                                      controller.changeTheme();
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      height: 35,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: controller.isDarkMode.value
                                            ? Colors.grey[300]
                                            : Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.wb_sunny_outlined,
                                        color: controller.isDarkMode.value
                                            ? Colors.white
                                            : Colors.amber,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.isDarkModeChange();
                                      controller.changeTheme();
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      height: 35,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: controller.isDarkMode.value
                                            ? Colors.black
                                            : Colors.grey[300],
                                      ),
                                      child: Icon(
                                        Ionicons.moon,
                                        color: controller.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'الوضع الليلي'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'ڕۆژ و شەوە'
                                      : 'Dark Mode',
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
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
                                controller.sharedLang.value == 'Arabic'
                                    ? 'الملف الشخصي'
                                    : controller.sharedLang.value == 'Arabic_EG'
                                        ? 'بەخێر بێیت بۆ ڵس ئەقارات با شوێنێکی گونجاوت بۆ بدۆزینەوە'
                                        : 'Welcome to Aqarat Lets find your dream home',
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 36, vertical: 5),
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
                                        child: Text(
                                            controller.sharedLang.value ==
                                                    'Arabic'
                                                ? 'يشتري'
                                                : controller.sharedLang.value ==
                                                        'Arabic_EG'
                                                    ? 'کڕین'
                                                    : 'Buy',
                                            style: TextStyle(
                                              color: controller.isPressed.value
                                                  ? AppColors.goldColor
                                                  : AppColors.greenColor,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 16,
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
                                          controller.sharedLang.value ==
                                                  'Arabic'
                                              ? 'يستأجر'
                                              : controller.sharedLang.value ==
                                                      'Arabic_EG'
                                                  ? 'کرێ گرتن'
                                                  : 'Rent',
                                          style: TextStyle(
                                            color: controller.isPressed.value
                                                ? AppColors.greenColor
                                                : AppColors.goldColor,
                                            fontFamily:
                                                GoogleFonts.robotoCondensed()
                                                    .fontFamily,
                                            fontSize: 16,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
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
                                          child: Text(
                                              controller.sharedLang.value ==
                                                      'Arabic'
                                                  ? 'سكني'
                                                  : controller.sharedLang
                                                              .value ==
                                                          'Arabic_EG'
                                                      ? 'نیشتەجێبوون'
                                                      : 'Residential',
                                              style: TextStyle(
                                                color: controller.buttonIndex
                                                            .value ==
                                                        0
                                                    ? AppColors.goldColor
                                                    : AppColors.greenColor,
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                                fontSize: 16,
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
                                            controller.sharedLang.value ==
                                                    'Arabic'
                                                ? 'تجاري'
                                                : controller.sharedLang.value ==
                                                        'Arabic_EG'
                                                    ? 'کۆمێرسیاڵ'
                                                    : 'Commercial',
                                            style: TextStyle(
                                              color: controller
                                                          .buttonIndex.value ==
                                                      1
                                                  ? AppColors.goldColor
                                                  : AppColors.greenColor,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 16,
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
                                            controller.sharedLang.value ==
                                                    'Arabic'
                                                ? 'سياحي'
                                                : controller.sharedLang.value ==
                                                        'Arabic_EG'
                                                    ? 'گەشتیاری'
                                                    : 'Tourism',
                                            style: TextStyle(
                                              color: controller
                                                          .buttonIndex.value ==
                                                      2
                                                  ? AppColors.goldColor
                                                  : AppColors.greenColor,
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 16,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.filterProperties(
                                      buyRentButton:
                                          controller.buyRentButton.value,
                                      propertyType:
                                          controller.propertyType.value);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize:
                                      Size(Get.width * 0.9, Get.height * 0.07),
                                ),
                                child: Text(
                                  controller.sharedLang.value == 'Arabic'
                                      ? 'تطبيق'
                                      : controller.sharedLang.value ==
                                              'Arabic_EG'
                                          ? 'پشاندان'
                                          : 'Apply',
                                  style: TextStyle(
                                    color: AppColors.goldColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.robotoCondensed()
                                        .fontFamily,
                                  ),
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
                                    controller.sharedLang.value == 'Arabic'
                                        ? 'العقارات المميزة'
                                        : controller.sharedLang.value ==
                                                'Arabic_EG'
                                            ? 'موڵکە تایبەتەکان'
                                            : 'Featured Properties',
                                    style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/feautured-properties',
                                          arguments: controller
                                              .featuredPropertiesItems);
                                    },
                                    child: Text(
                                      controller.sharedLang.value == 'Arabic'
                                          ? 'عرض الكل'
                                          : controller.sharedLang.value ==
                                                  'Arabic_EG'
                                              ? ' پیشاندانی هەمووی'
                                              : 'View All',
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
                                                        const BorderRadius.only(
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
                                controller.sharedLang.value == 'Arabic'
                                    ? 'العقارات الحديثة'
                                    : controller.sharedLang.value == 'Arabic_EG'
                                        ? 'موڵکە نوێکان'
                                        : 'New Properties',
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
                                                          const Icon(
                                                            Ionicons
                                                                .cash_outline,
                                                            color: AppColors
                                                                .greenColor,
                                                          ),
                                                          const SizedBox(
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
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Ionicons
                                                                .home_outline,
                                                            color: AppColors
                                                                .greenColor,
                                                          ),
                                                          const SizedBox(
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
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
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
                                                      const SizedBox(
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
