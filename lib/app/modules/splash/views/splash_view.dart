import 'package:aqarat/app/theme/app_colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: controller.chewieController != null &&
                      controller.chewieController!.videoPlayerController.value
                          .isInitialized
                  ? Chewie(
                      controller: controller.chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20),
                        Text(controller.Loading.value,
                            style: TextStyle(color: AppColors.blackColor)),
                      ],
                    ),
            ),
          );
        });
  }
}
