import 'package:get/get.dart';

import '../controllers/addfoodmethods_controller.dart';

class AddfoodmethodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddfoodmethodsController>(
      () => AddfoodmethodsController(),
    );
  }
}
