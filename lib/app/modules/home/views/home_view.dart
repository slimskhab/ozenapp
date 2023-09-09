import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ozen/app/modules/home/controllers/navigation_controller.dart';
import 'package:ozen/app/modules/home/views/customNavigationBar.dart';
import 'package:ozen/app/modules/home/views/notSelectedButton.dart';
import 'package:ozen/app/modules/home/views/selectedButton.dart';

import '../../../AppColors.dart';
import '../controllers/addpage_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/homepage_controller.dart';
import '../controllers/tracker_controller.dart';
import 'customChart.dart';
import 'customListTile.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();

    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Scaffold(
          bottomNavigationBar: CustomNavigationBar(
            onTapFunction: (index) {
              navigationController.pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.linear);
            },
          ),
          body: Container(
            color: Colors.black,
            padding: EdgeInsets.all(20),
            child: PageView(
              controller: homeController.navigationController.pageController,
              onPageChanged: (index) {
                homeController.navigationController.changePage(index);
              },
              children: [
                GetBuilder<HomePageController>(
                  builder: (homePageController) {
                    return Container(
                      color: Colors.red,
                      height: 30,
                    );
                  },
                ),
                GetBuilder<TrackerController>(builder: (trackerController) {
                  return ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset(
                                      "assets/images/vectorwhite.png"),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Color(0xff141414), width: 3)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  "Calories Tracker",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset("assets/images/avatar-1.png"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          controller.isDaily
                              ? selectedButton(
                                  buttonText: "Daily",
                                  onTapFunction: () {},
                                )
                              : notSelectedButton(
                                  buttonText: "Daily",
                                  onTapFunction: () {
                                    controller.isDaily = true;
                                    controller.isWeekly = false;
                                    controller.update();
                                  },
                                ),
                          SizedBox(
                            width: 20,
                          ),
                          controller.isWeekly
                              ? selectedButton(
                                  buttonText: "Weekly",
                                  onTapFunction: () {},
                                )
                              : notSelectedButton(
                                  buttonText: "Weekly",
                                  onTapFunction: () {
                                    controller.isWeekly = true;
                                    controller.isDaily = false;
                                    controller.update();
                                  },
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.isDaily ? "Today" : "This week",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xffF349B9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Fat",
                                style: TextStyle(color: Color(0xffF349B9)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xff0EFE01),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Carbs",
                                style: TextStyle(color: Color(0xff0EFE01)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xff0194FE),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Protein",
                                style: TextStyle(color: Color(0xff0194FE)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(20)),
                        child: BarChartSample4(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 67,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.23),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total Calories",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    "2800 kcal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              height: 67,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.23),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Target Calories",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    "3200 kcal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
                GetBuilder<AddPageController>(
                  builder: (addPageController) {
                    return IndexedStack(
                      index: addPageController.stackIndex,
                      children: [
                        ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                height: 40,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.proteinColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Protein",
                                              style: TextStyle(
                                                  color: AppColors.proteinColor,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "52 Left",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                height: 20,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                    color: AppColors.fatColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Fats",
                                              style: TextStyle(
                                                  color: AppColors.fatColor,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "10 Left",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                height: 30,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                    color: AppColors.mainColor!,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Carbs",
                                              style: TextStyle(
                                                  color: AppColors.mainColor,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "68 Left",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: CircleProgressBar(
                                      foregroundColor:
                                          Theme.of(context).primaryColor,
                                      backgroundColor: Color(0xffD9D9D9),
                                      value: 0.5,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "2000",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "Kcal left",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        addPageController.previousDate();
                                      },
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: Colors.white,
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: addPageController.date,
                                        firstDate:
                                            DateTime(DateTime.now().year),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1),
                                      ).then((value) {
                                        addPageController.changeDate(value!);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          addPageController.date.day ==
                                                  addPageController
                                                      .todayDate.day
                                              ? "Today , ${addPageController.date.day} ${addPageController.month}"
                                              : addPageController.date.day ==
                                                      addPageController
                                                              .todayDate.day +
                                                          1
                                                  ? "Tomorrow , ${addPageController.date.day} ${addPageController.month}"
                                                  : addPageController
                                                              .date.day ==
                                                          addPageController
                                                                  .todayDate
                                                                  .day -
                                                              1
                                                      ? "Yesterday , ${addPageController.date.day} ${addPageController.month}"
                                                      : "${addPageController.date.day} ${addPageController.month}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        addPageController.nextDate();
                                      },
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            customListTile(
                              imagePath: "assets/images/breakfast.png",
                              title: "Add Breakfast",
                              subtitle: "Recommended 500Kcal",
                              onTapFunction: () {
                                addPageController.mealName = "Breakfast";
                                addPageController.changeStack(1);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            customListTile(
                              imagePath: "assets/images/snacks.png",
                              title: "Add Snacks",
                              subtitle: "Recommended 500Kcal",
                              onTapFunction: () {
                                addPageController.mealName = "Snacks";

                                addPageController.changeStack(1);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            customListTile(
                              imagePath: "assets/images/lunch.png",
                              title: "Add Lunch",
                              subtitle: "Recommended 500Kcal",
                              onTapFunction: () {
                                addPageController.mealName = "Lunch";

                                addPageController.changeStack(1);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            customListTile(
                              imagePath: "assets/images/dinner.png",
                              title: "Add Dinner",
                              subtitle: "Recommended 500Kcal",
                              onTapFunction: () {
                                addPageController.mealName = "Dinner";

                                addPageController.changeStack(1);
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          addPageController.changeStack(0);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color(0xff141414),
                                                  width: 3)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Text(
                                        addPageController.mealName,
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
                            TextFormField(
                              onChanged: (text) {
                                print(text);
                              },
                              onTap: () {
                                addPageController.hintText = "";
                                addPageController.update();
                              },
                              onTapOutside: (event) {
                                addPageController.hintText = "Search Here";
                                addPageController.update();
                              },
                              controller: addPageController.searchText,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  filled: true,
                                  fillColor: Colors.black,
                                  hintText: addPageController.hintText,
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: Container(
                                  padding:EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.21)),
                              child: ListView.builder(
                                itemCount: addPageController.foodList.length,
                                  itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                      child: Text(
                                                        addPageController.foodList[index].foodName,
                                  style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold),
                                ),
                                                    ),
                                                  ),
                                                  IconButton(onPressed: (){
                                                    addPageController.changeStack(0);
                                                  }, icon: Icon(Icons.add_circle_outline,color: Colors.white,))
                                                ],
                                              ),
                                              Container(height: 2,color: Colors.white,)
                                            ],
                                          ),
                                        ),

                                      ],
                                    ));
                              }),
                            ))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          addPageController.changeStack(1);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color(0xff141414),
                                                  width: 3)),
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
                            SizedBox(
                              height: 50,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              style: TextStyle(
                                                  color: AppColors.carbsColor),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 30),
                                            decoration: BoxDecoration(
                                                color: Color(0xff616161)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              "Connect the app to a compatible Bluetooth-enabled scale to import nutrition information.",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              style: TextStyle(
                                                  color: AppColors.fatColor),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 30),
                                            decoration: BoxDecoration(
                                                color: Color(0xff616161)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                                "Use your device's camera to scan the display of nutritionals on your scale.",
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              style: TextStyle(
                                                  color:
                                                      AppColors.proteinColor),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 30),
                                            decoration: BoxDecoration(
                                                color: Color(0xff616161)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  color: Colors.grey,
                  height: 500,
                ),
                Container(
                  color: Colors.yellow,
                  height: 500,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
