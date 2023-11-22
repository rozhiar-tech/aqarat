
import 'package:aqarat/app/modules/favourite/views/favourite_view.dart';
import 'package:aqarat/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../../map_view/views/map_view_view.dart';
import '../../projects/views/projects_view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxInt pageIndex = 0.obs;

  final pages = [
    const HomeView(),
    const ProjectsView(),
    const FavouriteView(),
    const MapViewView(),
  ];

  final count = 0.obs;
  @override
  void onInit() {
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
