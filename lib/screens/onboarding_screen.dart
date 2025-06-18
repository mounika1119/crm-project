import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final OnboardingController onboardcontroller = OnboardingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // final page = controller.onboardingScreens[controller.selectedPageIndex.value];
        final index = onboardcontroller.selectedPageIndex.value;
        final page = onboardcontroller.onboardingScreens[index];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            // padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Vertically centers inside Expanded
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        height: 430,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          // color: const Color(0xfbf8ee),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(page.image, height: 250),
                            ),
                            Positioned(
                              top: 20,
                              left: 0,
                              right: 0,
                              child: Center(
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      onboardcontroller.onboardingScreens.length,
                                          (index) {
                                        return Obx(() => AnimatedContainer(
                                          duration: const Duration(milliseconds: 300),
                                          margin:
                                          const EdgeInsets.symmetric(horizontal: 4),
                                          height: 8,
                                          width:
                                          onboardcontroller.selectedPageIndex.value ==
                                              index
                                              ? 20
                                              : 8,
                                          decoration: BoxDecoration(
                                            color: onboardcontroller
                                                .selectedPageIndex.value ==
                                                index
                                                ? Colors.blue
                                                : Colors.grey,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ));
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        page.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Navigation button section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => onboardcontroller.skip(context),
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    GestureDetector(
                      onTap: () => onboardcontroller.nextPage(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    )

                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
