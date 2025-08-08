import 'package:flutter_demo/pages/day_29_di_modular/home/home_controller.dart';
import 'package:flutter_demo/pages/day_29_di_modular/service/counter_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //业务service 先注入，controller 依赖 service
    Get.lazyPut<CounterService>(() => CounterService());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
