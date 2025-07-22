import 'package:get/get.dart';

import '../service/counter_service.dart';

class HomeController extends GetxController {
  final CounterService counterService = Get.find();

  get count => counterService.count;

  void increment() => counterService.increment();

  void reset() => counterService.reset();

  @override
  void onInit() {
    super.onInit();
  }
}
