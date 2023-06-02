import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/screens/dashboard/dashboard.dart';
import 'package:getxdemo/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Getx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: "/dashboard", page: () => DashboardScreen()),
      ],
    );
  }
}
