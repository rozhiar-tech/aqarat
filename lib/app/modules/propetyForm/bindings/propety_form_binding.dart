import 'package:get/get.dart';

import '../controllers/propety_form_controller.dart';

class PropetyFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropetyFormController>(
      () => PropetyFormController(),
    );
  }
}
