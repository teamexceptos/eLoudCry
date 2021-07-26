import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage _secureStorage = FlutterSecureStorage();

Future saveData({dynamic data, String key}) async {
  await _secureStorage.write(key: key, value: data);
}

Future<String> readData({String key}) async {
  String data = await _secureStorage.read(key: key);
  return data;
}