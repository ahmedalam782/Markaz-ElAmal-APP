import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/Styles/Colors/app_colors.dart';
import '../../../shared/Styles/Images/app_image_assets.dart';
import '../../Cubits/onboarding_cubit.dart';
import '../../Screens/home_screen.dart';
import '../../States/onboarding_state.dart';
import 'onboarding_controller.dart';

class OnboardingDesign extends StatelessWidget {
  const OnboardingDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
        return PageView.builder(
          controller: onBoardingCubit.pageController,
          onPageChanged: onBoardingCubit.onPageChanged,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    width: MediaQuery.of(context).size.height*.47,
                    onBoardingCubit.onboardingList[index].image,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            onBoardingCubit.onboardingList[index].mainText,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: AppColor.textColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            onBoardingCubit.onboardingList[index].contentText,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: AppColor.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        OnBoardingController(
                          controller: onBoardingCubit.pageController,
                          count: onBoardingCubit.onboardingList.length,
                          onDotClicked: onBoardingCubit.onDotNavigationClick,
                          onPressedButton: onBoardingCubit.currentPage ==
                                  onBoardingCubit.onboardingList.length - 1
                              ? () => Navigator.popAndPushNamed(
                                  context, HomeScreen.routeName)
                              : onBoardingCubit.onNextPageClick,
                          btnName: onBoardingCubit.currentPage ==
                                  onBoardingCubit.onboardingList.length - 1
                              ? 'Start'
                              : 'Next',
                        ),
                        const SizedBox(height: 15,),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: onBoardingCubit.onboardingList.length,
        );
      },
    );
  }
}
