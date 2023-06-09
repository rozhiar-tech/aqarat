import 'package:get/get.dart';

class FeauturedPropertiesController extends GetxController {
  //TODO: Implement FeauturedPropertiesController
  RxList feauturedPropertiesItems = [].obs;
  RxString title = 'Feautured Properties'.obs;
  final argument = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    feauturedPropertiesItems.value = argument;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
