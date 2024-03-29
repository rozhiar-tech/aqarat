import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _buildPhoneNumberTile(String phoneNumber, BuildContext context) {
      return GestureDetector(
        onTap: () {
          // Trigger a call when the phone number tile is tapped
          launch('tel:$phoneNumber');
          Navigator.of(context).pop(); // Close the modal bottom sheet
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            phoneNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blue, // Change the color as needed
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    void _showContactNumbers(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200, // Adjust the height as needed
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildPhoneNumberTile('07703241212', context),
                  _buildPhoneNumberTile('07705241212', context),
                  _buildPhoneNumberTile('07705261212', context),
                  _buildPhoneNumberTile('07501501212', context),
                ],
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: GetX(
          init: HomeController(),
          builder: (controller) {
            return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(90),
                  child: AppBar(
                      title: GestureDetector(
                        onTap: () {
                          controller.isExpanded.value =
                              !controller.isExpanded.value;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.width * 0.2,
                          child: Image.asset("assets/tt.jpeg"),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: controller.isExpanded.value
                                ? MediaQuery.of(context).size.width * 0.80
                                : kToolbarHeight,
                            child: controller.isExpanded.value
                                ? TextField(
                                    // Customize your text field here
                                    decoration: const InputDecoration(
                                      hintText: 'Search',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    onChanged: (value) {
                                      // Handle text field changes here
                                    },
                                    onSubmitted: (value) async {
                                      controller.isExpanded.value =
                                          value.isNotEmpty;

                                      // Call the method with the entered text to search for properties
                                      await controller.searchProperties(value);
                                      print(value);
                                      if (controller.properties.isNotEmpty) {
                                        print("hell");
                                        Get.to(() => TempScreen(
                                            properties: controller.properties));
                                      }

                                      // Submit logic here
                                      // For example, search based on the entered value
                                    },
                                    // Clearing the text field will minimize it
                                    // You might need to adapt this to your exact use case
                                    onTap: () {
                                      // if (controller
                                      //         .textEditingController.text !=
                                      //     '') {
                                      //   controller.isExpanded.value = false;
                                      // }
                                    },
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        controller.isExpanded.value =
                                            !controller.isExpanded.value;
                                      },
                                      icon: const Icon(
                                        Ionicons.search,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                      centerTitle: true,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: controller.isDarkMode.value
                            ? AppColors.whiteColor
                            : AppColors.goldColor,
                      )),
                ),
                drawer: Drawer(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: controller.isDarkMode.value
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'LS Aqar',
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
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/app_logo.png"),
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
                            Icon(
                              Ionicons.language_outline,
                              color: controller.isDarkMode.value
                                  ? AppColors.whiteColor
                                  : AppColors.greenColor,
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
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
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
                                      color: controller.isDarkMode.value
                                          ? AppColors.whiteColor
                                          : AppColors.greenColor,
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
                                      color: controller.isDarkMode.value
                                          ? AppColors.whiteColor
                                          : AppColors.greenColor,
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
                                      color: controller.isDarkMode.value
                                          ? AppColors.whiteColor
                                          : AppColors.greenColor,
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
                            controller.userId.value == ''
                                ? Icon(
                                    Ionicons.log_in_outline,
                                    color: controller.isDarkMode.value
                                        ? AppColors.whiteColor
                                        : AppColors.greenColor,
                                  )
                                : Icon(
                                    Ionicons.log_out_outline,
                                    color: controller.isDarkMode.value
                                        ? AppColors.whiteColor
                                        : AppColors.greenColor,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.userId.value == ''
                                  ? controller.sharedLang.value == 'Arabic'
                                      ? 'تسجيل الدخول'
                                      : controller.sharedLang.value ==
                                              'Arabic_EG'
                                          ? 'چوونەژوورەوە'
                                          : 'Login'
                                  : controller.sharedLang.value == 'Arabic'
                                      ? 'تسجيل الخروج'
                                      : controller.sharedLang.value ==
                                              'Arabic_EG'
                                          ? 'چوونەدەرەوە'
                                          : 'Logout',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          controller.userId.value == ''
                              ? Get.toNamed('/login')
                              : controller.logout();
                        },
                      ),
                      // ListTile(
                      //   title: Row(
                      //     children: [
                      //       AnimatedContainer(
                      //         duration: Duration(milliseconds: 100),
                      //         height: 35,
                      //         width: 64,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(20),
                      //           color: Colors.grey[300],
                      //         ),
                      //         child: Row(
                      //           children: [
                      //             GestureDetector(
                      //               onTap: () {
                      //                 controller.isDarkModeChange();
                      //                 controller.changeTheme();
                      //               },
                      //               child: AnimatedContainer(
                      //                 duration: Duration(milliseconds: 500),
                      //                 height: 35,
                      //                 width: 32,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(20),
                      //                   color: controller.isDarkMode.value
                      //                       ? Colors.grey[300]
                      //                       : Colors.white,
                      //                 ),
                      //                 child: Icon(
                      //                   Icons.wb_sunny_outlined,
                      //                   color: controller.isDarkMode.value
                      //                       ? Colors.white
                      //                       : Colors.amber,
                      //                   size: 17,
                      //                 ),
                      //               ),
                      //             ),
                      //             GestureDetector(
                      //               onTap: () {
                      //                 controller.isDarkModeChange();
                      //                 controller.changeTheme();
                      //               },
                      //               child: AnimatedContainer(
                      //                 duration: Duration(milliseconds: 500),
                      //                 height: 35,
                      //                 width: 32,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(20),
                      //                   color: controller.isDarkMode.value
                      //                       ? Colors.black
                      //                       : Colors.grey[300],
                      //                 ),
                      //                 child: Icon(
                      //                   Ionicons.moon,
                      //                   color: controller.isDarkMode.value
                      //                       ? Colors.white
                      //                       : Colors.black,
                      //                   size: 17,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text(
                      //         controller.sharedLang.value == 'Arabic'
                      //             ? 'الوضع الليلي'
                      //             : controller.sharedLang.value == 'Arabic_EG'
                      //                 ? 'ڕۆژ و شەوە'
                      //                 : 'Dark Mode',
                      //         style: TextStyle(
                      //           color: AppColors.greenColor,
                      //           fontSize: 16,
                      //           fontFamily:
                      //               GoogleFonts.robotoCondensed().fontFamily,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   onTap: () {},
                      // ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              Icons.add,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'تقديم نموذج الطلب'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'پێشکەش کردنی داواکاری'
                                      : 'submit request form',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            )
                          ],
                        ),
                        onTap: () => Get.toNamed('form'),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              Icons.add_box_sharp,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'أضف الممتلكات الخاصة بك'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'پێشکەش کردنی موڵک بۆ بڵاو کردنەوە'
                                      : 'add your property',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            )
                          ],
                        ),
                        onTap: () => Get.toNamed('propety-form'),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(Icons.delete),
                            const SizedBox(width: 10),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'حذف الحساب'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'سڕینەوەی هەژمار'
                                      : 'delete account',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            )
                          ],
                        ),
                        onTap: () async {
                          Get.defaultDialog(
                              title: 'Confirmation',
                              middleText:
                                  'Are you sure you want to delete your account?',
                              textConfirm: 'Yes',
                              textCancel: 'No',
                              confirmTextColor: Colors.white,
                              cancelTextColor: Colors.black,
                              onConfirm: (() {
                                controller.logout();
                              }));
                        },
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            // Icon for Exchange Rate
                            const Icon(Icons.monetization_on),
                            const SizedBox(width: 10),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'سعر الصرف'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'ئاڵوگۆڕی دراو'
                                      : 'Exchange Rate',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          // Handle Exchange Rate tile tap
                          Get.toNamed('exchange-rate');
                        },
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            // Icon for About Us
                            const Icon(Icons.info_outline),
                            const SizedBox(width: 10),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'معلومات عنا'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'زانیاری دەربارەی ئێمە'
                                      : 'About Us',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          // Handle About Us tile tap
                          Get.toNamed("/about-us");
                        },
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            // Icon for Contact Us
                            const Icon(Icons.phone),
                            const SizedBox(width: 10),
                            Text(
                              controller.sharedLang.value == 'Arabic'
                                  ? 'اتصل بنا'
                                  : controller.sharedLang.value == 'Arabic_EG'
                                      ? 'په‌یوه‌ندیمان بکه‌'
                                      : 'Contact Us',
                              style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.robotoCondensed().fontFamily,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          // Handle Contact Us tile tap
                          _showContactNumbers(context);
                        },
                      ),
                      // Separator line
                      const Divider(),
                      // Facebook logo ListTile
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Facebook
                          GestureDetector(
                            onTap: () {
                              // Handle Facebook tap
                              launch('https://www.facebook.com/ls.aqarat/');
                            },
                            child: Icon(
                              Ionicons.logo_facebook,
                              size: 40, // Adjust size as needed
                              color: controller.isDarkMode.value
                                  ? AppColors.whiteColor
                                  : AppColors.greenColor,
                            ),
                          ),

                          // TikTok
                          GestureDetector(
                            onTap: () {
                              // Handle TikTok tap
                              launch('https://www.tiktok.com/@ls.aqar?lang=ar');
                            },
                            child: Icon(
                              Ionicons.logo_tiktok,
                              size: 40, // Adjust size as needed
                              color: controller.isDarkMode.value
                                  ? AppColors.whiteColor
                                  : AppColors.greenColor,
                            ),
                          ),

                          // Instagram
                          GestureDetector(
                            onTap: () {
                              // Handle Instagram tap
                              launch(
                                  'https://www.instagram.com/ls_aqar/?next=%2Fropa.deportiva.medellin%2F');
                            },
                            child: Icon(
                              Ionicons.logo_instagram,
                              size: 40, // Adjust size as needed
                              color: controller.isDarkMode.value
                                  ? AppColors.whiteColor
                                  : AppColors.greenColor,
                            ),
                          ),

                          // Website
                          GestureDetector(
                            onTap: () {
                              // Handle website tap
                              launch('http://www.lsaqar.com/');
                            },
                            child: Icon(
                              Ionicons.logo_web_component,
                              size: 40, // Adjust size as needed
                              color: controller.isDarkMode.value
                                  ? AppColors.whiteColor
                                  : AppColors.greenColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.sharedLang.value == 'Arabic'
                                    ? 'مرحبا بكم في ال اس عقار دعنا نجد لك أفضل منزل '
                                    : controller.sharedLang.value == 'Arabic_EG'
                                        ? 'بەخێر بێیت بۆ ئێڵ ئێس عقار با باشترین ماڵت بۆ بدۆزینەوە'
                                        : 'Welcome to LS Aqar Lets Find You The Best Home',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.robotoCondensed().fontFamily,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.02, vertical: 5),
                              child: Container(
                                height: Get.height * 0.09,
                                width: Get.width * 0.9,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF7F9F8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isPressedChange();
                                      controller.buyRentButton('Buy');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height: Get.height * 0.09,
                                        width: Get.width * 0.4,
                                        decoration: BoxDecoration(
                                          color: controller.isPressed.value
                                              ? const Color(0xffF7F9F8)
                                              : AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                              controller.sharedLang.value ==
                                                      'Arabic'
                                                  ? 'يشتري'
                                                  : controller.sharedLang
                                                              .value ==
                                                          'Arabic_EG'
                                                      ? 'کڕین'
                                                      : 'Buy',
                                              style: TextStyle(
                                                color: controller
                                                        .isPressed.value
                                                    ? (controller
                                                            .isDarkMode.value
                                                        ? Colors.grey[500]
                                                        : Colors.grey[500])
                                                    : (controller
                                                            .isDarkMode.value
                                                        ? AppColors.greenColor
                                                        : AppColors.greenColor),
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                                fontSize: 16,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.isPressedChange();
                                      controller.buyRentButton.value = 'Rent';
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(microseconds: 300),
                                        height: Get.height * 0.1,
                                        width: Get.width * 0.4,
                                        decoration: BoxDecoration(
                                          color: controller.isPressed.value
                                              ? AppColors.whiteColor
                                              : const Color(0xffF7F9F8),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                  ? (controller.isDarkMode.value
                                                      ? AppColors.greenColor
                                                      : Colors.grey[500])
                                                  : (controller.isDarkMode.value
                                                      ? Colors.grey[500]
                                                      : Colors.grey[500]),
                                              fontFamily:
                                                  GoogleFonts.robotoCondensed()
                                                      .fontFamily,
                                              fontSize: 16,
                                            ),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.02, vertical: 5),
                              child: Container(
                                height: Get.height * 0.1,
                                width: Get.width * 0.9,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF7F9F8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.buttonIndexChange(0);
                                        controller.propertyType('Residential');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          height: Get.height * 0.09,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.buttonIndex.value ==
                                                        0
                                                    ? AppColors.whiteColor
                                                    : const Color(0xffF7F9F8),
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
                                                      ? (controller
                                                              .isDarkMode.value
                                                          ? AppColors.greenColor
                                                          : Colors.grey[500])
                                                      : (controller
                                                              .isDarkMode.value
                                                          ? Colors.grey[500]
                                                          : AppColors
                                                              .greenColor),
                                                  fontFamily: GoogleFonts
                                                          .robotoCondensed()
                                                      .fontFamily,
                                                  fontSize: 16,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.buttonIndexChange(1);
                                        controller.propertyType('Commercial');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          height: Get.height * 0.09,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.buttonIndex.value ==
                                                        1
                                                    ? AppColors.whiteColor
                                                    : const Color(0xffF7F9F8),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller.sharedLang.value ==
                                                      'Arabic'
                                                  ? 'تجاري'
                                                  : controller.sharedLang
                                                              .value ==
                                                          'Arabic_EG'
                                                      ? 'بازرگانی'
                                                      : 'Commercial',
                                              style: TextStyle(
                                                color: controller.buttonIndex
                                                            .value ==
                                                        1
                                                    ? (controller
                                                            .isDarkMode.value
                                                        ? AppColors.greenColor
                                                        : Colors.grey[500])
                                                    : (controller
                                                            .isDarkMode.value
                                                        ? Colors.grey[500]
                                                        : AppColors.greenColor),
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                                fontSize: 16,
                                              ),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          height: Get.height * 0.09,
                                          width: Get.width * 0.25,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.buttonIndex.value ==
                                                        2
                                                    ? AppColors.whiteColor
                                                    : const Color(0xffF7F9F8),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller.sharedLang.value ==
                                                      'Arabic'
                                                  ? 'سياحي'
                                                  : controller.sharedLang
                                                              .value ==
                                                          'Arabic_EG'
                                                      ? 'گەشتیاری'
                                                      : 'Tourism',
                                              style: TextStyle(
                                                color: controller.buttonIndex
                                                            .value ==
                                                        2
                                                    ? (controller
                                                            .isDarkMode.value
                                                        ? AppColors.greenColor
                                                        : Colors.grey[500])
                                                    : (controller
                                                            .isDarkMode.value
                                                        ? Colors.grey[500]
                                                        : AppColors.greenColor),
                                                fontFamily: GoogleFonts
                                                        .robotoCondensed()
                                                    .fontFamily,
                                                fontSize: 16,
                                              ),
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
                                  backgroundColor: AppColors.blackColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize:
                                      Size(Get.width * 0.9, Get.height * 0.09),
                                ),
                                child: Text(
                                  controller.sharedLang.value == 'Arabic'
                                      ? 'تطبيق'
                                      : controller.sharedLang.value ==
                                              'Arabic_EG'
                                          ? 'پشاندان'
                                          : 'Apply',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Divider(
                            color: Colors.grey[200],
                            thickness: 2,
                          ),
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
                                            ? 'ئۆفەری تایبەت'
                                            : 'Special Offer',
                                    style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? AppColors.whiteColor
                                          : AppColors.greenColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        '/feautured-properties',
                                        arguments:
                                            controller.featuredPropertiesItems,
                                      );
                                    },
                                    child: Text(
                                      controller.sharedLang.value == 'Arabic'
                                          ? 'عرض الكل'
                                          : controller.sharedLang.value ==
                                                  'Arabic_EG'
                                              ? ' پیشاندانی هەمووی'
                                              : 'View All',
                                      style: TextStyle(
                                        color: controller.isDarkMode.value
                                            ? AppColors.whiteColor
                                            : AppColors.greenColor,
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
                                                      index]['address'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['description'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['area'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['bedrooms'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['bathrooms'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['floors'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['rooms'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['rwgasore'],
                                                  controller.isDarkMode.value,
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['latitude'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['longtitude'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['videoUrl'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['id'],
                                                  controller
                                                      .featuredPropertiesItems,
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['createdAt'],
                                                  controller
                                                          .featuredPropertiesItems[
                                                      index]['agent'],
                                                ]);
                                          },
                                          child: Container(
                                            height: Get.height * 0.4,
                                            width: Get.width * 0.5,
                                            decoration: BoxDecoration(
                                              color: controller.isDarkMode.value
                                                  ? AppColors.whiteColor
                                                  : const Color(0xffF5F5F5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: Get.height * 0.24,
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
                                                  child: SizedBox(
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
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Ionicons
                                                                  .cash_outline,
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? AppColors
                                                                      .blackColor
                                                                  : AppColors
                                                                      .blackColor,
                                                              size: 17,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              controller
                                                                  .featuredPropertiesItems[
                                                                      index]
                                                                      ['price']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
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
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .category_outlined,
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? AppColors
                                                                      .blackColor
                                                                  : AppColors
                                                                      .blackColor,
                                                              size: 17,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              controller.featuredPropertiesItems[
                                                                      index]
                                                                  ['category'],
                                                              style: TextStyle(
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
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
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .home_outlined,
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? AppColors
                                                                      .blackColor
                                                                  : AppColors
                                                                      .blackColor,
                                                              size: 17,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              controller
                                                                      .featuredPropertiesItems[
                                                                  index]['type'],
                                                              style: TextStyle(
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
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
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.numbers,
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? AppColors
                                                                      .blackColor
                                                                  : AppColors
                                                                      .blackColor,
                                                              size: 17,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              controller
                                                                  .featuredPropertiesItems[
                                                                      index]
                                                                      ['id']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
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
                                  color: controller.isDarkMode.value
                                      ? AppColors.whiteColor
                                      : AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.robotoCondensed().fontFamily,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ToggleButtons(
                                color: controller.isDarkMode.value
                                    ? AppColors.whiteColor
                                    : AppColors.greenColor,
                                isSelected: [
                                  controller.isGrid.value,
                                  !controller.isGrid.value
                                ],
                                borderWidth: 0,
                                onPressed: (index) {
                                  controller.toggleViewMode();
                                },
                                children: const [
                                  Icon(Icons.view_agenda),
                                  Icon(Icons.view_module),
                                ],
                              ),
                            ),
                            controller.isGrid.value == false
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 11,
                                    ),
                                    child: SizedBox(
                                      height: Get.height * 0.8,
                                      width: Get.width,
                                      child: Column(
                                        children: List.generate(
                                          (controller.properties.length / 2)
                                              .ceil(), // Calculate the number of rows needed
                                          (rowIndex) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                2, // Two columns in each row
                                                (colIndex) {
                                                  var index =
                                                      rowIndex * 2 + colIndex;
                                                  if (index <
                                                      controller
                                                          .properties.length) {
                                                    var property = controller
                                                        .properties[index];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            '/single-property',
                                                            arguments: [
                                                              property['photos']
                                                                  as List,
                                                              property['price'],
                                                              property['type'],
                                                              property[
                                                                  'address'],
                                                              property[
                                                                  'description'],
                                                              property['area'],
                                                              property[
                                                                  'bedrooms'],
                                                              property[
                                                                  'bathrooms'],
                                                              property[
                                                                  'floors'],
                                                              property['rooms'],
                                                              property[
                                                                  'rwgasore'],
                                                              controller
                                                                  .isDarkMode
                                                                  .value,
                                                              property[
                                                                  'latitude'],
                                                              property[
                                                                  'longtitude'],
                                                              property[
                                                                  'videoUrl'],
                                                              property["id"],
                                                              controller
                                                                  .properties,
                                                              property[
                                                                  'createdAt'],
                                                              property['agent'],
                                                            ]);
                                                      },
                                                      child: Container(
                                                        width: Get.width *
                                                            0.4, // Adjust as needed
                                                        decoration:
                                                            BoxDecoration(
                                                          color: controller
                                                                  .isDarkMode
                                                                  .value
                                                              ? AppColors
                                                                  .whiteColor
                                                              : const Color(
                                                                  0xffF5F5F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height:
                                                                  Get.height *
                                                                      0.16,
                                                              width: Get.width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    property[
                                                                        'photos'][0],
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.1,
                                                              width: Get.width,
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    property[
                                                                            'price']
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: controller
                                                                              .isDarkMode
                                                                              .value
                                                                          ? AppColors
                                                                              .blackColor
                                                                          : AppColors
                                                                              .greenColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          GoogleFonts.robotoCondensed()
                                                                              .fontFamily,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    property[
                                                                        'type'],
                                                                    style:
                                                                        TextStyle(
                                                                      color: controller
                                                                              .isDarkMode
                                                                              .value
                                                                          ? AppColors
                                                                              .blackColor
                                                                          : AppColors
                                                                              .greenColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          GoogleFonts.robotoCondensed()
                                                                              .fontFamily,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    property[
                                                                        'address'],
                                                                    style:
                                                                        TextStyle(
                                                                      color: controller
                                                                              .isDarkMode
                                                                              .value
                                                                          ? AppColors
                                                                              .blackColor
                                                                          : AppColors
                                                                              .greenColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          GoogleFonts.robotoCondensed()
                                                                              .fontFamily,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    property[
                                                                            'id']
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: controller
                                                                              .isDarkMode
                                                                              .value
                                                                          ? AppColors
                                                                              .blackColor
                                                                          : AppColors
                                                                              .greenColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          GoogleFonts.robotoCondensed()
                                                                              .fontFamily,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return SizedBox(
                                                        width: Get.width *
                                                            0.4); // Placeholder for empty space
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: List.generate(
                                        controller.properties.length, (index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed('/single-property',
                                                    arguments: [
                                                      controller
                                                              .properties[index]
                                                          ['photos'] as List,
                                                      controller
                                                              .properties[index]
                                                          ['price'],
                                                      controller
                                                              .properties[index]
                                                          ['type'],
                                                      controller
                                                              .properties[index]
                                                          ['address'],
                                                      controller
                                                              .properties[index]
                                                          ['description'],
                                                      controller
                                                              .properties[index]
                                                          ['area'],
                                                      controller
                                                              .properties[index]
                                                          ['bedrooms'],
                                                      controller
                                                              .properties[index]
                                                          ['bathrooms'],
                                                      controller
                                                              .properties[index]
                                                          ['floors'],
                                                      controller
                                                              .properties[index]
                                                          ['rooms'],
                                                      controller
                                                              .properties[index]
                                                          ['rwgasore'],
                                                      controller
                                                          .isDarkMode.value,
                                                      controller
                                                              .properties[index]
                                                          ['latitude'],
                                                      controller
                                                              .properties[index]
                                                          ['longtitude'],
                                                      controller
                                                              .properties[index]
                                                          ['videoUrl'],
                                                      controller
                                                              .properties[index]
                                                          ['id'],
                                                      controller.properties,
                                                      controller
                                                              .properties[index]
                                                          ['createdAt'],
                                                      controller
                                                              .properties[index]
                                                          ['agent'],
                                                    ]);
                                              },
                                              child: Container(
                                                height: Get.height * 0.33,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                          .isDarkMode.value
                                                      ? AppColors.whiteColor
                                                      : const Color(0xffF5F5F5),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: Get.height * 0.33,
                                                      width: Get.width * 0.4,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              controller.properties[
                                                                          index]
                                                                      ['photos']
                                                                  [0]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
                                                                        .greenColor,
                                                                size: 17,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                controller
                                                                    .properties[
                                                                        index][
                                                                        'price']
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? AppColors
                                                                          .blackColor
                                                                      : AppColors
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
                                                              Icon(
                                                                Ionicons
                                                                    .home_outline,
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
                                                                        .greenColor,
                                                                size: 17,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                controller.properties[
                                                                        index]
                                                                    ['type'],
                                                                style:
                                                                    TextStyle(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? AppColors
                                                                          .blackColor
                                                                      : AppColors
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
                                                              Icon(
                                                                Ionicons
                                                                    .location_outline,
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
                                                                        .greenColor,
                                                                size: 17,
                                                              ),
                                                              Text(
                                                                controller.properties[
                                                                        index]
                                                                    ['address'],
                                                                style:
                                                                    TextStyle(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? AppColors
                                                                          .blackColor
                                                                      : AppColors
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
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.13,
                                                            width:
                                                                Get.width * 0.4,
                                                            child: Text(
                                                              controller
                                                                  .properties[
                                                                      index][
                                                                      'description']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? AppColors
                                                                        .blackColor
                                                                    : AppColors
                                                                        .greenColor,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                    }),
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

class TempScreen extends StatelessWidget {
  final List<dynamic> properties;

  const TempScreen({Key? key, required this.properties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searched Property"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          final imageUrl = property['photos'][0];

          return ListTile(
            onTap: () {
              // Navigate to a new screen with property details
              Get.toNamed('/single-property', arguments: [
                properties[index]['photos'] as List,
                properties[index]['price'],
                properties[index]['type'],
                properties[index]['address'],
                properties[index]['description'],
                properties[index]['area'],
                properties[index]['bedrooms'],
                properties[index]['bathrooms'],
                properties[index]['floors'],
                properties[index]['rooms'],
                properties[index]['rwgasore'],
                false,
                properties[index]['latitude'],
                properties[index]['longtitude'],
                properties[index]['videoUrl'],
                properties[index]['id'],
                properties,
                properties[index]['createdAt'],
                properties[index]['agent'],
              ]);
            },
            leading: imageUrl != null
                ? Image.network(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : Container(),
            title: Text(property['address']),
            subtitle: Text(property['description']),
            trailing: Text(property['id'].toString()),
          );
        },
      ),
    );
  }
}
