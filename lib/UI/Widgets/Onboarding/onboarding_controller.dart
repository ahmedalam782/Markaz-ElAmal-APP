import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/Styles/Colors/app_colors.dart';
import '../../../shared/Styles/Images/app_image_assets.dart';

class OnBoardingController extends StatelessWidget {
  final PageController controller;
  final int count;
  final Function(int) onDotClicked;
  final Function() onPressedButton;
  final String btnName;

  const OnBoardingController({
    super.key,
    required this.controller,
    required this.count,
    required this.onDotClicked,
    required this.onPressedButton,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SmoothPageIndicator(
            effect: const WormEffect(
              activeDotColor: AppColor.primaryColor,
              dotColor: AppColor.secondPrimaryColor,
              dotHeight: 11,
              dotWidth: 56,
            ),
            controller: controller,
            count: count,
            onDotClicked: onDotClicked,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressedButton,
          child: Text(
            btnName,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: AppColor.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onPressedButton,
          child: Image.asset(
            AppImageAssets.arrowForwardImage,
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
