import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ozen/app/modules/home/controllers/home_controller.dart';

class notSelectedButton extends StatelessWidget {
   notSelectedButton({super.key,required this.buttonText,required this.onTapFunction});
String buttonText;
   void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap:onTapFunction,
          child: Opacity(
            opacity: 0.3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2,color: Colors.white),
              ),
              child: Center(
                child: Text(buttonText,style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ));
  }
}
