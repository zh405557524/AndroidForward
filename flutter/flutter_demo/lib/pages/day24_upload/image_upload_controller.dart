import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'image_upload_service.dart';

class ImageUploadController extends GetxController {
  final picker = ImagePicker();

  var selectedFile = Rx<File?>(null);

  var uploadUrl = "".obs;

  var isUploading = false.obs;

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedFile.value = File(picked.path);
    }
  }

  Future<void> uploadImage() async {
    final file = selectedFile.value;
    if (file == null) return;
    isUploading.value = true;
    try {
      final url = await ImageUploadService.uploadImage(file);
      uploadUrl.value = url;
    } catch (e) {
      print("error uploading image: $e");
    } finally {
      isUploading.value = false;
    }
  }
}
