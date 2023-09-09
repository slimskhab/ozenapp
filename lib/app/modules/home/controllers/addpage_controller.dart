import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../AppConsts.dart';
import '../../../Crud.dart';
import '../models/Food.dart';

class AddPageController extends GetxController  with Crud{

DateTime date=DateTime.now();
String month="";

 DateTime todayDate=DateTime.now();
int stackIndex=0;
String mealName="";
TextEditingController searchText=TextEditingController();

String hintText="";

List<dynamic> foodList=[];



getFoods() async {
  var request = await postRequest(getFoodPath, {});
  if (request["status"] == "success") {
    for (var item in request["data"]) {
      Food foodItem = Food.fromJson(item); // Assuming Food.fromJson is a constructor or factory method in your Food class
      foodList.add(foodItem);
    }
    return foodList;
  }
}

changeStack(index){
  stackIndex=index;
  update();
}
 changeDate(DateTime newDate){
   date = newDate;

   switch (date.month) {
     case 1:
       month="Jan";
       break;
     case 2:
       month="Feb";
       break;
     case 3:
       month="Mar";
       break;
     case 4:
       month="Apr";
       break;
     case 5:
       month="May";
       break;
     case 6:
       month="June";
       break;
     case 7:
       month="July";
       break;
     case 8:
       month="Aug";
       break;
     case 9:
       month="Sept";
       break;
     case 10:
       month="Oct";
       break;
     case 11:
       month="Nov";
       break;
     case 12:
       month="Dec";
       break;
     default:
       print('Unknown fruit.');
   }
   update();
 }

previousDate(){
  date=date.subtract(Duration(days: 1));
  switch (date.month) {
    case 1:
      month="Jan";
      break;
    case 2:
      month="Feb";
      break;
    case 3:
      month="Mar";
      break;
    case 4:
      month="Apr";
      break;
    case 5:
      month="May";
      break;
    case 6:
      month="June";
      break;
    case 7:
      month="July";
      break;
    case 8:
      month="Aug";
      break;
    case 9:
      month="Sept";
      break;
    case 10:
      month="Oct";
      break;
    case 11:
      month="Nov";
      break;
    case 12:
      month="Dec";
      break;
    default:
      print('Unknown fruit.');
  }
  update();
}

 nextDate(){
   date=date.add(Duration(days: 1));
   switch (date.month) {
     case 1:
       month = "Jan";
       break;
     case 2:
       month = "Feb";
       break;
     case 3:
       month = "Mar";
       break;
     case 4:
       month = "Apr";
       break;
     case 5:
       month = "May";
       break;
     case 6:
       month = "June";
       break;
     case 7:
       month = "July";
       break;
     case 8:
       month = "Aug";
       break;
     case 9:
       month = "Sept";
       break;
     case 10:
       month = "Oct";
       break;
     case 11:
       month = "Nov";
       break;
     case 12:
       month = "Dec";
       break;
     default:
       print('Unknown fruit.');
   }
   update();
 }

@override
  void onInit() {
    super.onInit();
getFoods();
print(foodList);

    switch (date.month) {
      case 1:
        month="Jan";
        break;
      case 2:
        month="Feb";
        break;
      case 3:
        month="Mar";
        break;
      case 4:
        month="Apr";
        break;
      case 5:
        month="May";
        break;
      case 6:
        month="June";
        break;
      case 7:
        month="July";
        break;
      case 8:
        month="Aug";
        break;
      case 9:
        month="Sept";
        break;
      case 10:
        month="Oct";
        break;
      case 11:
        month="Nov";
        break;
      case 12:
        month="Dec";
        break;
      default:
        print('Unknown fruit.');
    }
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
