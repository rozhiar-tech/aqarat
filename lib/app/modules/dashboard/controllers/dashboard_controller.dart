import 'package:aqarat/app/modules/chat/views/chat_view.dart';
import 'package:aqarat/app/modules/chatRoom/views/chat_room_view.dart';
import 'package:aqarat/app/modules/favourite/views/favourite_view.dart';
import 'package:aqarat/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxInt pageIndex = 0.obs;

  final pages = [
    HomeView(),
    ChatRoomView(),
    FavouriteView(),
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
