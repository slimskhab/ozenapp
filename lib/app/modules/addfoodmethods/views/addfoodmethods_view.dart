import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ozen/app/AppColors.dart';
import 'package:ozen/app/modules/home/views/customNavigationBar.dart';

import '../../home/controllers/navigation_controller.dart';
import '../controllers/addfoodmethods_controller.dart';

class AddFoodMethodsView extends GetView<AddfoodmethodsController> {
  const AddFoodMethodsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();

    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(onTapFunction: (index ) {
          Get.offAndToNamed("/home");
          navigationController.changePage(index);

        },),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xff141414), width: 3)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          "Select Input Methode",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2,
                                width: 75,
                                color: AppColors.carbsColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Bluetooth",
                                style: TextStyle(color: AppColors.carbsColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 2,
                                width: 75,
                                color: AppColors.carbsColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              width: 280,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: Color(0xff616161).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Connect the app to a compatible Bluetooth-enabled scale to import nutrition information.",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),

                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2,
                                width: 75,
                                color: AppColors.fatColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Scan Display",
                                style: TextStyle(color: AppColors.fatColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 2,
                                width: 75,
                                color: AppColors.fatColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              width: 280,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: Color(0xff616161).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                  "Use your device's camera to scan the display of nutritionals on your scale.",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2,
                                width: 75,
                                color: AppColors.proteinColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Manual Input",
                                style: TextStyle(color: AppColors.proteinColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 2,
                                width: 75,
                                color: AppColors.proteinColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              width: 280,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: Color(0xff616161).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Manually enter the nutrition information for your food item.",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ));
  }
}
