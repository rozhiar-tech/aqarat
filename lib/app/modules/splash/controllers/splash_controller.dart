import 'dart:async';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  RxString title = "SplashView".obs;

  late VideoPlayerController controller;
  RxBool controllerInitialized = false.obs;
  Future<void> _initializeController() async {
    try {
      controller = VideoPlayerController.asset('assets/LOGO.mp4')
        ..addListener(videoListener);

      await controller.initialize();
    
        controllerInitialized = true.obs;
        controller.play();

        // Start a timer to navigate after a certain duration
        Timer(Duration(seconds: 5), () {
          navigateToDashboard();
        });
      
    } catch (error) {
      print("Error initializing video player: $error");
    }
  }
 void videoListener() {
    if (controller.value.position >= controller.value.duration) {
      navigateToDashboard();
    }
  }

  void navigateToDashboard() {
    // Navigate to the dashboard screen
    Get.offAllNamed('/dashboard'); // Adjust the route name as needed
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _initializeController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void increment() => count.value++;
}
