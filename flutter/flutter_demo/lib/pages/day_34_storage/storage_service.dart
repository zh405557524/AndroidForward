import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();

  ///写入本地数据
  static Future<void> setString(String key, String value) async {
    await _box.write(key, value);
  }

  ///读取本地数据
  static String? getString(String key) {
    return _box.read<String>(key);
  }

  //移除
  static Future<void> remove(String key) async {
    await _box.remove(key);
  }

  static Future<void> clear() async {
    await _box.erase();
  }

}
