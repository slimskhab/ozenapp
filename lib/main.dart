import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'app/modules/home/controllers/navigation_controller.dart';
import 'app/routes/app_pages.dart';

void main() {



  Get.put(NavigationController());

  runApp(const MyApp());  WidgetsFlutterBinding.ensureInitialized();


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff0EFE01),
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),

        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0EFE01)),
        useMaterial3: true,
      ),
      initialRoute: "/signup",
      getPages:AppPages.routes,

    );
  }
}
