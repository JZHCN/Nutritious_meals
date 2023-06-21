import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static void saveStorage(String key, String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  static readStorage(String key) async {
    if (key.isEmpty) {
      return null;
    }
    const storage = FlutterSecureStorage();
    var data = await storage.read(key: key);

    return data;
  }

  static deleteStorage(String key) async {
    // if (key.isEmpty) {
    //   return null;
    // }
    const storage = FlutterSecureStorage();
    var data = await storage.delete(key: key);

    return data;
  }
}
