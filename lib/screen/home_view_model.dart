import 'package:get/get.dart';
import 'package:practice_clean_architecture/screen/home_state.dart';

class HomeViewModel extends GetxController {
  final _homeState = Rx<HomeState>(HomeState(count: 0));
  get homeState => _homeState.value;

  incrementCounter() {
    final count = _homeState.value.count + 1;
    _homeState.value = _homeState.value.copyWith(count: count);
  }
}
