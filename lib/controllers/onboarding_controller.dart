
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/onboarding_model.dart';
import '../screens/authscreen/signin_screen.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isLastPage => selectedPageIndex.value == onboardingScreens.length - 1;

  void nextPage(BuildContext context) {
    if (selectedPageIndex < 2) {
      selectedPageIndex++;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  SignInScreen()),
      );
    }
  }

  void skip(BuildContext context) {
    // nextPage(context);
    // Get.to(SignInScreen());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) =>  SignInScreen()),
    );
  }

  List<Onboarding> onboardingScreens = [
    Onboarding(
        'assets/images/on_board1.png',
        'Create Your Folder ',
        'Get an overview of how you are performing and motivate.' ),
    Onboarding(
        'assets/images/on_board2.png',
        'Fill your folders',
        'Get an overview of how you are performing and motivate.'),
    Onboarding(
        'assets/images/on_board3.png',
        'Get more done together',
        'Get an overview of how you are performing and motivate.'),
  ];

}