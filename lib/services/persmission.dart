import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  static Future<bool> requestPermission(Permission permission) async {
    bool requestState;

    await permission.request().isGranted.then((value) async {
      requestState = value;
    });

    return requestState;
  }
}