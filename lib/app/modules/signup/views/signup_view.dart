import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';



class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.black,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff141414),width: 3)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),

                  Container(height:71,width:71,child: Image.asset("assets/images/whitelogo.png"))
                ],
              ),
              SizedBox(height: 50,),

              TextFormField(
                keyboardType: TextInputType.text,
                validator: (text) {

                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (GetUtils.isEmail(text!)) {
                    return "This is not a valid email";
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                validator: (text) {

                },
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: "Pick a strong password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (text) {

                },
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: "Rewrite password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  Get.toNamed("/home");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0EFE01), // Start color
                        Color(0xFF5D7DCF), // End color
                      ],
                      stops: [0.0, 0.94], // Stops for each color
                    ),
                  ),
                  child: Center(child: Text("Create account",style: TextStyle(color: Colors.black,fontSize: 15),)),
                  width: 214,
                  height: 55,
                ),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(child: Center(child: FaIcon(FontAwesomeIcons.google,color: Colors.white,)),decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: Colors.white)
                  ),width: 140,height: 53,),
                  Container(child: Center(child: FaIcon(FontAwesomeIcons.apple,color: Colors.white,)),decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: Colors.white)
                  ),width: 140,height: 53,)
                ],
              ),
              SizedBox(height: 20,),

              Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                Text("Already have an account?",style: TextStyle(color: Colors.white,fontSize: 18),),
                SizedBox(width: 10,),
                InkWell(onTap: (){
                  Get.toNamed("/login");
                },child: Text("Login",style: TextStyle(color: Theme.of(context).primaryColor,decoration: TextDecoration.underline,decorationColor: Theme.of(context).primaryColor,fontSize: 18),))
              ],)



            ],
          ),
        ),
      )
    );
  }
}
