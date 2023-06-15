import 'package:get/get.dart';

import '../modules/all_properties/bindings/all_properties_binding.dart';
import '../modules/all_properties/views/all_properties_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chatRoom/bindings/chat_room_binding.dart';
import '../modules/chatRoom/views/chat_room_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/favourite/bindings/favourite_binding.dart';
import '../modules/favourite/views/favourite_view.dart';
import '../modules/feautured_properties/bindings/feautured_properties_binding.dart';
import '../modules/feautured_properties/views/feautured_properties_view.dart';
import '../modules/filtered_properties/bindings/filtered_properties_binding.dart';
import '../modules/filtered_properties/views/filtered_properties_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map_view/bindings/map_view_binding.dart';
import '../modules/map_view/views/map_view_view.dart';
import '../modules/single_property/bindings/single_property_binding.dart';
import '../modules/single_property/views/single_property_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.native,
      name: _Paths.CHAT_ROOM,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
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
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.FILTERED_PROPERTIES,
      page: () => const FilteredPropertiesView(),
      binding: FilteredPropertiesBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  
    GetPage(
      name: _Paths.MAP_VIEW,
      page: () => const MapViewView(),
      binding: MapViewBinding(),
    ),
  ];
}
