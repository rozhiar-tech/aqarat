import 'package:get/get.dart';

import '../controllers/filtered_properties_controller.dart';

class FilteredPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilteredPropertiesController>(
      () => FilteredPropertiesController(),
    );
  }
}
