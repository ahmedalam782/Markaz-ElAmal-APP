import 'package:flutter/material.dart';
import 'package:patient_app/UI/Screens/home_screen.dart';
import 'package:patient_app/UI/Screens/onboarding_screen.dart';
import 'package:patient_app/UI/Screens/splash_screen.dart';

class RoutesScreen {
  static Map<String, Widget Function(BuildContext)> routes = {
   SplashScreen.routeName:(_)=>SplashScreen(),
   HomeScreen.routeName:(_)=>HomeScreen(),
    OnboardingScreen.routeName:(_)=>OnboardingScreen(),
  };
}