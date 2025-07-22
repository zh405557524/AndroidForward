import 'package:flutter_demo/pages/day_28_binding/detail_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }

}
