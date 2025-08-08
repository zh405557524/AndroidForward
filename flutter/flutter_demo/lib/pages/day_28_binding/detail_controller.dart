import 'package:get/get.dart';

class DetailController extends GetxController {
  late int id;
  late String name;

  @override
  void onInit() {
    //获取路由参数
    id = int.tryParse(Get.parameters['id'] ?? '') ?? 0;
    name = Get.parameters['name'] ?? '';
    super.onInit();
  }
}
