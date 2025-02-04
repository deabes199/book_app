import 'package:book_app/core/database/shared_pref.dart';
import 'package:book_app/core/di/di.dart';
import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/on_boarding/data/on_boarding_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: PageView.builder(
              itemCount: OnboardingModel.onBoardingData.length,
              controller: controller,
              itemBuilder: (context, currntIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    vertcalSpace(40),
                    Image.asset(
                        OnboardingModel.onBoardingData[currntIndex].image),
                    vertcalSpace(20),
                    Text(
                      OnboardingModel.onBoardingData[currntIndex].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    vertcalSpace(10),
                    Text(
                      textAlign: TextAlign.center,
                      OnboardingModel.onBoardingData[currntIndex].subTitle,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currntIndex != 2
                            ? TextButton(
                                onPressed: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.bounceIn);
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.bounceIn);
                                },
                                child: const Text(
                                  'Back',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                )),
                        Row(
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 10,
                              width: currntIndex == index ? 20 : 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: currntIndex == index
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            );
                          }),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () {
                            getIt<CacheHelper>()
                                .saveData(key: 'login', value: true)
                                .then((value) {
                              currntIndex == 2
                                  ? Navigator.pushReplacementNamed(
                                      context, Routes.homeScreen)
                                  : controller.nextPage(
                                      duration:const Duration(milliseconds: 300),
                                      curve: Curves.bounceIn);
                            });
                          },
                          child: Text(
                            currntIndex == 2 ? 'Get Started' : 'Next',
                            style:const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
