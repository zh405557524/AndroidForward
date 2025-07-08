import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day23_form_submit/feedback_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'feedback_model.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({super.key});

  final controller = Get.put(FeedbackController());
  final nameCtrl = TextEditingController();
  final contentCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.context= context;
    return Scaffold(
        appBar: AppBar(title: const Text("Day 23 -意见反馈")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: '姓名'),
            ),
            const SizedBox(height: 16),
            TextField(
                controller: contentCtrl, decoration: const InputDecoration(labelText: '反馈内容'), maxLength: 5),
            const SizedBox(height: 24),
            Obx(() => ElevatedButton(
                onPressed: controller.isSubmitting.value
                    ? null
                    : () {
                        final form =
                            FeedbackForm(userName: nameCtrl.text.trim(), content: contentCtrl.text.trim());
                        controller.submit(form);
                      },
                child: controller.isSubmitting.value
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('提交反馈')))
          ]),
        ));
  }
}
