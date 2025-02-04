import 'package:book_app/core/database/shared_pref.dart';
import 'package:book_app/core/di/di.dart';
import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<Offset> imageAnimation;
  late AnimationController imagecontroller;
  @override
  void initState() {
    super.initState();
    initImageAnimation();
    initTextAnimation();
    navigate();
  }

  void navigate() {
    bool isLogin = getIt<CacheHelper>().getData(key: 'login') ?? false;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          // ignore: use_build_context_synchronously
          context,
          isLogin ? Routes.homeScreen : Routes.onBoardingScreen);
    });
  }

  void initTextAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideAnimation = Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
        .animate(controller);
    controller.forward();
  }

  void initImageAnimation() {
    imagecontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    imageAnimation = Tween<Offset>(begin:const Offset(0, -10), end: Offset.zero)
        .animate(imagecontroller);
    imagecontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: imageAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: imageAnimation,
                  child: Image.asset(AppAssets.splash),
                );
              },
            ),
            vertcalSpace(20),
            AnimatedBuilder(
              animation: slideAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slideAnimation,
                  child: const Text(
                    'INFINITY',
                    style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff223263),
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
