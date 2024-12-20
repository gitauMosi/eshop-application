import 'package:eshop/views/auth/login_page.dart';
import 'package:eshop/views/auth/signup_page.dart';
import 'package:eshop/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/signup", page: () => const SignupPage()),
      ],
    );
  }
}
