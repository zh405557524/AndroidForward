import 'package:get_storage/get_storage.dart';

class AuthService {
  static final _box = GetStorage();
  static final _tokenKey = 'token';

  static bool get isLoggedIn => _box.read(_tokenKey) != null;

  static String? get token => _box.read<String>(_tokenKey);

  static Future<void> login(String token) async {
    await _box.write(_tokenKey, token);
  }

  static Future<void> logout() async {
    await _box.remove(_tokenKey);
  }
}
