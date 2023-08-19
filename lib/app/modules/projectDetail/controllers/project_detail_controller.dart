import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailController extends GetxController {
  //TODO: Implement ProjectDetailController
  RxString title = 'Details'.obs;
  RxString description = ''.obs;
  RxString name = ''.obs;
  RxList images = [].obs;
  RxString location = ''.obs;
  RxString grassArea = ''.obs;
  RxString client = ''.obs;
  RxInt selectedImageIndex = 0.obs;
  RxString videoUrl = ''.obs;

  CarouselController carouselController = CarouselController();

  retrieveArguments() {
    final arguments = Get.arguments;

    name.value = arguments[0];
    description.value = arguments[1];
    location.value = arguments[2];
    grassArea.value = arguments[3].toString();
    client.value = arguments[4];
    images.value = arguments[5];
    videoUrl.value = arguments[6];
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    retrieveArguments();
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
