import 'package:get/get.dart';

import '../controllers/single_property_controller.dart';

class SinglePropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SinglePropertyController>(
      () => SinglePropertyController(),
    );
  }
}
