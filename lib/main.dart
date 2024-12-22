import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/views/auth/login_page.dart';
import 'package:eshop/views/auth/signup_page.dart';
import 'package:eshop/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/theme_controllers.dart';
import 'utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController()); 
  Get.put(ProductController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

   final ThemeController themeController = Get.find(); 

  @override
  Widget build(BuildContext context) {
    return Obx(()=>GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EShop',
      theme: AppThemes.lightTheme,  
        darkTheme: AppThemes.darkTheme,  
        themeMode: themeController.themeMode.value,  
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/signup", page: () => const SignupPage()),
      ],
    ));
  }
}
