import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NavigationController extends GetxController {

  PageController pageController = PageController();


  int currentIndex=0;
  DateTime currentDate = DateTime.now();


  changePage(int index){
    currentIndex=index;
    print(index);
    update();
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
