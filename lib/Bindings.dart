import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Dark_mode_Controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(DarkModeController());
  }
}
