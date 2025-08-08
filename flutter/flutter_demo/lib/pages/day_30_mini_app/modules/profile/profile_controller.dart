import 'package:flutter_demo/models/user_model.dart';
import 'package:flutter_demo/pages/day_30_mini_app/services/user_service.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class ProfileController extends GetxController {
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    user.value = UserService.getUser();
    super.onInit();
  }
}
