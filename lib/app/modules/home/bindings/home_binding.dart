import 'package:get/get.dart';
import 'package:ozen/app/modules/home/controllers/addpage_controller.dart';
import 'package:ozen/app/modules/home/controllers/homepage_controller.dart';
import 'package:ozen/app/modules/home/controllers/navigation_controller.dart';

import '../controllers/home_controller.dart';
import '../controllers/tracker_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(HomeController());

    Get.lazyPut<TrackerController>(
          () => TrackerController(),fenix: true
    );

    Get.lazyPut<HomePageController>(
          () => HomePageController(),fenix: true
    );
    Get.lazyPut<AddPageController>(
            () => AddPageController(),fenix: true
    );
  }
}
