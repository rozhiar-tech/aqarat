import 'package:aqarat/app/modules/exchange_rate/controllers/exchange_rate_controller.dart';
import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ionicons/ionicons.dart';

class ExchangeRateView extends GetView<ExchangeRateController> {
  const ExchangeRateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ExchangeRateController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.blackColor,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: const Text(
                'Exchange Rate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: Container(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      color: AppColors.blackColor,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.15, // Top position adjusted for overlap
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: Get.height *
                          0.13, // Adjust the height for the hover effect
                      width: Get.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Ionicons.logo_usd,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.sharedLang.value == 'Arabic'
                                      ? 'دولار امریکی'
                                      : controller.sharedLang.value ==
                                              'Arabic_EG'
                                          ? 'دۆلاری ئەمریکی'
                                          : 'USD',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "100 \$",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height *
                        0.34, // Top position for the white container
                    child: Container(
                      color: AppColors.whiteColor,
                      height: Get.height *
                          0.5, // Adjust the height for the white container
                      width: Get.width,
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: Get.height *
                              0.13, // Adjust the height for the hover effect
                          width: Get.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                          AssetImage("assets/40957690.jpg"),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.sharedLang.value == 'Arabic'
                                          ? 'دینار عراقی'
                                          : controller.sharedLang.value ==
                                                  'Arabic_EG'
                                              ? 'دیناری عێراقی'
                                              : 'IQD',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${controller.iqd.value} IQD",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: Get.height *
                              0.13, // Adjust the height for the hover effect
                          width: Get.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 26.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage("assets/eur.png")),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.sharedLang.value == 'Arabic'
                                          ? 'ایرو'
                                          : controller.sharedLang.value ==
                                                  'Arabic_EG'
                                              ? 'یۆرۆ'
                                              : 'EURO',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${controller.euro.value} EURO",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: Get.height *
                              0.13, // Adjust the height for the hover effect
                          width: Get.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage("assets/poun.png")),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.sharedLang.value == 'Arabic'
                                          ? 'پاوند بریتانی'
                                          : controller.sharedLang.value ==
                                                  'Arabic_EG'
                                              ? 'پاوەندی بەریتانی'
                                              : 'POUND',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${controller.pound.value} Pound",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
