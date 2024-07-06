import 'package:apo/network_controller.dart';
import 'package:get/get.dart';
import 'theme_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
