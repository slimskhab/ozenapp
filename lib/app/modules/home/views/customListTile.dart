import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class customListTile extends StatelessWidget {
  customListTile({super.key, required this.imagePath,required this.title,required this.subtitle,required this.onTapFunction});

  String imagePath;
  String title;
  String subtitle;
  void Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.21),
        borderRadius: BorderRadius.circular(20),
      ),
      child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                    imagePath)),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.white),),
                    Text(subtitle,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))
                  ],
                )),
            GestureDetector(
              onTap: onTapFunction,
              child: Container(
                child: FaIcon(
                  FontAwesomeIcons.add,
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(right: 20),
              ),
            )
          ],
        ),

    );
  }
}
