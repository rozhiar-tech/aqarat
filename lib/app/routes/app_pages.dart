import 'package:get/get.dart';

import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/all_properties/bindings/all_properties_binding.dart';
import '../modules/all_properties/views/all_properties_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chatRoom/bindings/chat_room_binding.dart';
import '../modules/chatRoom/views/chat_room_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/exchange_rate/bindings/exchange_rate_binding.dart';
import '../modules/exchange_rate/views/exchange_rate_view.dart';
import '../modules/favourite/bindings/favourite_binding.dart';
import '../modules/favourite/views/favourite_view.dart';
import '../modules/feautured_properties/bindings/feautured_properties_binding.dart';
import '../modules/feautured_properties/views/feautured_properties_view.dart';
import '../modules/filtered_properties/bindings/filtered_properties_binding.dart';
import '../modules/filtered_properties/views/filtered_properties_view.dart';
import '../modules/form/bindings/form_binding.dart';
import '../modules/form/views/form_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map_view/bindings/map_view_binding.dart';
import '../modules/map_view/views/map_view_view.dart';
import '../modules/projectDetail/bindings/project_detail_binding.dart';
import '../modules/projectDetail/views/project_detail_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';
import '../modules/propetyForm/bindings/propety_form_binding.dart';
import '../modules/propetyForm/views/propety_form_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/single_property/bindings/single_property_binding.dart';
import '../modules/single_property/views/single_property_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

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
    GetPage(
      name: _Paths.PROJECTS,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAIL,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => const FormView(),
      binding: FormBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.EXCHANGE_RATE,
      page: () => const ExchangeRateView(),
      binding: ExchangeRateBinding(),
    ),
    GetPage(
      name: _Paths.PROPETY_FORM,
      page: () => const PropetyFormView(),
      binding: PropetyFormBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
  ];
}
