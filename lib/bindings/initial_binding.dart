import 'package:get/get.dart';

import '../controller/main_controller.dart';

class InitialBinding extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MainController());
  }
}
