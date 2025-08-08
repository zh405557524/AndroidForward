import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day24_upload/image_upload_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageUploadPage extends StatelessWidget {
  ImageUploadPage({super.key});

  final controller = Get.put(ImageUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Day 24 - 图片上传")),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              controller.selectedFile.value != null
                  ? Image.file(controller.selectedFile.value!, height: 200)
                  : const Placeholder(fallbackHeight: 200),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: controller.pickImage, child: const Text("选择图片")),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.isUploading.value ? null : controller.uploadImage,
                child: controller.isUploading.value
                    ? const CircularProgressIndicator(strokeWidth: 2)
                    : const Text("上传图片"),
              ),
              const SizedBox(height: 20),
              if (controller.uploadUrl.isNotEmpty)
                Column(
                  children: [
                    const Text("上传成功，图片链接："),
                    Text(controller.uploadUrl.value, style: const TextStyle(color: Colors.blue))
                  ],
                )
            ]);
          })),
    );
  }
}
