import 'package:get/get.dart';
import 'package:practice_clean_architecture/screen/home_screen/home_view_model.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewModel());
  }
}
