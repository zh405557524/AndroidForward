import 'dart:convert';

import 'package:flutter_demo/core/api_client.dart';

import 'feedback_model.dart';

class FeedbackService {
  static Future<bool> submitFeedback(FeedbackForm form) async {
    final res = await ApiClient.post<bool>('/feedback', data: form.toJson(), fromJsonT: (json) => true);

    return res.data;
  }
  
}
