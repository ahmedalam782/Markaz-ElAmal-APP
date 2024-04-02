import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/shared/Styles/Images/app_image_assets.dart';

import '../../Models/onboarding_model.dart';
import '../States/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialStates());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;
  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppImageAssets.selectDoctorImage,
      mainText: "Choose your doctor",
      contentText: "Application provide you with alot of experienced doctors you can see these profile and choose one you want to appointment with him.",
    ),
    OnboardingModel(
      image: AppImageAssets.dateImage,
      mainText: "Choose date and time",
      contentText: "The application can help you choose the appropriate date and time for you and the selected doctor.",
    ),
    OnboardingModel(
      image: AppImageAssets.selectDocImage,
      mainText: "Communicate with your doctor",
      contentText: "Once you access the profile of doctor you selected you can communicate with him and send any message ",
    ),
  ];
  PageController pageController = PageController();

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnBoardingPageChangeStates());
  }

  void onDotNavigationClick(int index) {
    currentPage = index;
    pageController.jumpToPage(currentPage);
    emit(OnBoardingDotNavigationClickStates());
  }

  void onSkipClick() {
    currentPage = onboardingList.length - 1;
    pageController.jumpToPage(currentPage);
    emit(OnBoardingSkipClickStates());
  }

  void onNextPageClick() {
    if (currentPage == onboardingList.length - 1) {
      // ConstantData.isFirstOpen = "true";
      // CacheHelper.saveData(
      //     key: ConstantData.isFirstOpenApp, value: ConstantData.isFirstOpen);
      emit(OnBoardingLastPageClickStates());
    } else {
      currentPage++;
      pageController.jumpToPage(currentPage);
      emit(OnBoardingNextPageClickStates());
    }
  }
}
