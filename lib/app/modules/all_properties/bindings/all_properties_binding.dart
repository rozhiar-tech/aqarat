import 'package:get/get.dart';

import '../controllers/all_properties_controller.dart';

class AllPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPropertiesController>(
      () => AllPropertiesController(),
    );
  }
}
