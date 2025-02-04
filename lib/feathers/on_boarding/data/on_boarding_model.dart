import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/core/utils/app_strings.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel(
      {required this.image, required this.title, required this.subTitle});
  static List<OnboardingModel> onBoardingData = [
    OnboardingModel(
        image: AppAssets.on1,
        title: AppStrings.titleOne,
        subTitle: AppStrings.subTitleOne),
    OnboardingModel(
        image: AppAssets.on2,
        title: AppStrings.titleTwo,
        subTitle: AppStrings.subTitleTwo),
    OnboardingModel(
        image: AppAssets.on3,
        title: AppStrings.titleThree,
        subTitle: AppStrings.subTitleThree)
  ];
}
