import 'dart:async';

import 'package:aqarat/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  RxString Loading = "Loading".obs;

  late VideoPlayerController controller;
  ChewieController? chewieController;

  sendUserToDashboardAfterThreeSeconds() async {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.DASHBOARD);
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initializePlayer();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    chewieController?.dispose();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void increment() => count.value++;

  Future<void> initializePlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://firebasestorage.googleapis.com/v0/b/aqarat-5f021.appspot.com/o/LOGO.mp4?alt=media&token=8be8eadb-d042-48e2-93e3-dcdf9da2dd11"));
    await controller.initialize();
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
      allowFullScreen: false,
      allowPlaybackSpeedChanging: false,
      showControls: false,
      showControlsOnInitialize: false,
      placeholder: Container(
        color: Colors.white,
      ),
    );
    update();
    sendUserToDashboardAfterThreeSeconds();
  }
}
