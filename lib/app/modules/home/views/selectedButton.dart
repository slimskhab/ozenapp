import 'package:flutter/material.dart';

class selectedButton extends StatelessWidget {
  selectedButton({super.key,required this.buttonText,required this.onTapFunction});
  String buttonText;
  void Function()? onTapFunction;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: onTapFunction,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xff161616),
                borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.white
              )
            ),
            child: Center(
              child: Text(buttonText,style: TextStyle(color: Theme.of(context).primaryColor),),
            ),
          ),
        ));
  }
}
