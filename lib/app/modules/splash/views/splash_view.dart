import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
              child: controller.controllerInitialized.value
                  ? AspectRatio(
                      aspectRatio: controller.controller.value.aspectRatio,
                      child: VideoPlayer(controller.controller),
                    )
                  : CircularProgressIndicator(),
            ),
          );
        });
  }
}
