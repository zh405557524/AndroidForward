import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../utils/toast_util.dart';
import 'feedback_model.dart';
import 'feedback_service.dart';

class FeedbackController extends GetxController {
  var isSubmitting = false.obs;

  Future<void> submit(FeedbackForm form)async{
    isSubmitting.value = true;
    try{
      final success = await FeedbackService.submitFeedback(form);
      if(success){
        ToastUtil.show("反馈提交成功");
      }
    }catch (e){
      print("提交反馈失败: $e");
      ToastUtil.show("提交反馈失败: $e");
    } finally {
      isSubmitting.value = false;
    }

  }
}
