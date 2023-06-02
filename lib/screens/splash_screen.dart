import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getxdemo/const/app_images.dart';
import 'package:getxdemo/const/colors.dart';
import 'package:getxdemo/widgets/all_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData();
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? storedUserData = sharedPreferences.getString('userData');

    print("storedUserData");
    print(storedUserData);

    await Future.delayed(const Duration(seconds: 3), () {
      if (storedUserData != null) {
        if (mounted) {
          setState(() {});
          // gotoWithoutBack(context, const DashboardScreen());
        }
      } else {
        // gotoWithoutBack(context, const LoginScreen());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: fullHeight(context),
            width: fullWidth(context),
            color: topColor,
            child: Center(
              child: Container(
                height: 80,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.appIconLight),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: fullWidth(context),
              child: const Align(
                alignment: Alignment.center,
                child: SpinKitRing(
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
