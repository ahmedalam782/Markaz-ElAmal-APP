import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/UI/Screens/onboarding_screen.dart';
import 'package:patient_app/shared/Styles/Colors/app_colors.dart';
import 'package:patient_app/shared/Styles/Images/app_image_assets.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, OnboardingScreen.routeName),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImageAssets.splashLogoImage),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Markaz ElAmal",
              style: GoogleFonts.peralta(
                textStyle: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
