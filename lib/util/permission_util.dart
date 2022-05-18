import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> requestPermission(Permission permission) async {
    bool isGranted = await permission.isGranted;
    if (!isGranted) {
      final status = await permission.request();
      switch (status) {
        case PermissionStatus.denied:
        case PermissionStatus.restricted: // suport for ios
          isGranted = false;
          break;
        case PermissionStatus.granted:
        case PermissionStatus.limited: // suport for ios
          isGranted = true;
          break;
        case PermissionStatus.permanentlyDenied: // suport for android
          await openAppSettings();
          break;
      }
      return isGranted;
    }
    return isGranted;
  }

  static Future<List<bool>> requestPermissions(
      List<Permission> permissions) async {
    List<bool> results = [];
    for (Permission permission in permissions) {
      final result = await requestPermission(permission);
      results.add(result);
    }
    return results;
  }
}
