import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/UI/Cubits/onboarding_cubit.dart';
import 'package:patient_app/UI/States/onboarding_state.dart';
import 'package:patient_app/UI/Widgets/Onboarding/onboarding_design.dart';

import '../../shared/Styles/Colors/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'OnboardingScreen';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
          return Scaffold(
            backgroundColor: AppColor.primaryColor,
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              leading: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Center(
                    child: Text(
                      "AR",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: onBoardingCubit.onSkipClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      onBoardingCubit.currentPage ==
                              onBoardingCubit.onboardingList.length - 1
                          ? ''
                          : 'Skip',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: const OnboardingDesign(),
          );
        },
      ),
    );
  }
}
