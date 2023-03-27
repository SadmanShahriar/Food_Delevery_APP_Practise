import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_string.dart';

import 'package:food_delivery/ui/responsive/views/onboarding.dart';
import 'package:food_delivery/ui/responsive/views/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.app_name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Max',
      ),
      home: Splash(),
    );
  }
}

 