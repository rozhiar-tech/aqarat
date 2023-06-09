import 'package:get/get.dart';

class FilteredPropertiesController extends GetxController {
  //TODO: Implement FilteredPropertiesController
  RxList filteredPropertiesItems = [].obs;
  final argument = Get.arguments;
  RxString title = 'Filter'.obs;



  final count = 0.obs;
  @override
  void onInit() {
    filteredPropertiesItems.value = argument;
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
