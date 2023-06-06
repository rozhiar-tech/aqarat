import 'package:get/get.dart';

import '../modules/all_properties/bindings/all_properties_binding.dart';
import '../modules/all_properties/views/all_properties_view.dart';
import '../modules/chatRoom/bindings/chat_room_binding.dart';
import '../modules/chatRoom/views/chat_room_view.dart';
import '../modules/favourite/bindings/favourite_binding.dart';
import '../modules/favourite/views/favourite_view.dart';
import '../modules/feautured_properties/bindings/feautured_properties_binding.dart';
import '../modules/feautured_properties/views/feautured_properties_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/single_property/bindings/single_property_binding.dart';
import '../modules/single_property/views/single_property_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () => const FavouriteView(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_PROPERTY,
      page: () => const SinglePropertyView(),
      binding: SinglePropertyBinding(),
    ),
    GetPage(
      name: _Paths.FEAUTURED_PROPERTIES,
      page: () => const FeauturedPropertiesView(),
      binding: FeauturedPropertiesBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PROPERTIES,
      page: () => const AllPropertiesView(),
      binding: AllPropertiesBinding(),
    ),
  ];
}
