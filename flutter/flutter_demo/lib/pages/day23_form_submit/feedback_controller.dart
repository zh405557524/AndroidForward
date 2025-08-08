import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/log_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../utils/toast_util.dart';
import 'feedback_model.dart';
import 'feedback_service.dart';

class FeedbackController extends GetxController {
  var TAG = "FeedbackController";
  var isSubmitting = false.obs;
  BuildContext? context;
  
  FeedbackController({this.context});

  Future<void> submit(FeedbackForm form) async {
    isSubmitting.value = true;
    try {
      final success = await FeedbackService.submitFeedback(form);
      if (success) {
        LogUtil.i(TAG, "提交反馈成功: ${form.toJson()}");
        ToastUtil.show(context!, "反馈提交成功，谢谢您的反馈！");
      }
    } catch (e) {
      print("提交反馈失败: $e");
      if (context != null) {
        ToastUtil.show(context!, "提交反馈失败，请稍后重试");
      }
    } finally {
      isSubmitting.value = false;
    }
  }
}
