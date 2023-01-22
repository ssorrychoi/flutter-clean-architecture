import 'package:get/get.dart';
import 'package:practice_clean_architecture/router/routes.dart';
import 'package:practice_clean_architecture/screen/date_contries_screen/date_contries_screen.dart';
import 'package:practice_clean_architecture/screen/home_screen/home_screen.dart';
import 'package:practice_clean_architecture/screen/home_screen/home_screen_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.dateCountriesScreen,
      page: () => const DateCountriesScreen(),
    ),
  ];
}
