

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ozen/app/modules/home/controllers/home_controller.dart';

import '../controllers/navigation_controller.dart';

class CustomNavigationBar extends StatelessWidget {
   CustomNavigationBar({super.key, required this.onTapFunction});
  void Function(int)? onTapFunction;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (navigationController) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationController.currentIndex,
          onTap: onTapFunction,
          backgroundColor: Color(0xff161616).withOpacity(0.84),
          elevation: 0,
          // Set BottomNavigationBar background to transparent
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.white),
          items: [
            BottomNavigationBarItem(
                activeIcon: Container(
                    height: 30,
                    child: Image.asset(
                      "assets/images/selectedlogo.png",
                    )),
                icon: Container(
                    height: 30,
                    child: Image.asset(
                      "assets/images/whitelogo.png",
                    )),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Container(
                    height: 30,
                    child: Image.asset(
                      "assets/images/trackerselected.png",
                    )),
                icon: Container(
                    height: 30,
                    child: Image.asset(
                      "assets/images/trackerunselected.png",
                    )),
                label: "Tracker"),
            BottomNavigationBarItem(
                activeIcon: Container(
                    height: 30,
                    child: Image.asset(
                      "assets/images/gridselected.png",
                    )),
                icon: Container(
                    height: 30,
                    child: Image.asset(
                      "assets/images/gridunselected.png",
                    )),
                label: "Add"),
            BottomNavigationBarItem(
                icon: Container(
                    height: 30, child: Icon(Icons.person_outline)),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Container(
                    height: 30,
                    child: Icon(Icons.notifications_none_outlined)),
                label: "Notification"),
          ],
        );
      },
    );
  }
}
