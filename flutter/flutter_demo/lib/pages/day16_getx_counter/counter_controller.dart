import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  void increment() => count++;

  void decrement() => count--;

}
