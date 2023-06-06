import 'package:get/get.dart';

import '../controllers/feautured_properties_controller.dart';

class FeauturedPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeauturedPropertiesController>(
      () => FeauturedPropertiesController(),
    );
  }
}
