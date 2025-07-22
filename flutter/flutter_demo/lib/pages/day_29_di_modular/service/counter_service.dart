import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class CounterService extends GetxService {
  var count = 0.obs;

  void increment() {
    count.value++;
    count.refresh();
  }

  void reset() {
    count.value = 0;
    count.refresh();
  }
}
