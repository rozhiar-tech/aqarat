import 'package:get/get.dart';

import '../controllers/exchange_rate_controller.dart';

class ExchangeRateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExchangeRateController>(
      () => ExchangeRateController(),
    );
  }
}
