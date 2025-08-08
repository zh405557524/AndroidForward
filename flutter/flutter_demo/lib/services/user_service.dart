import 'dart:convert';

import 'package:flutter_demo/core/api_client.dart';
import 'package:flutter_demo/models/user_model.dart';

class UserService {
  static Future<List<User>> getUserList() async {
    final res = await ApiClient.get<List<User>>(
      '/users',
      fromJson: (json) => (json as List).map((e) => User.fromJson(e)).toList(),
    );
    return res.data;
  }
}
