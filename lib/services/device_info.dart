import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceService {

  final deviceInfo = DeviceInfoPlugin();
  Map<String, dynamic> deviceData = {};

  Future<Map<String, dynamic>> getDeviceData() async {
    Map<String, dynamic> platformOS = {};

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      platformOS["deviceUUID"] = iosInfo.identifierForVendor;
      platformOS["deviceName"] = 'iOS';
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      platformOS["deviceUUID"] = androidInfo.androidId;
      platformOS["deviceName"] = 'Android';
    }

    deviceData = platformOS;
    return platformOS;
  }
}