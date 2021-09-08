class OnBoardingModel {
  late String title;
  late String images;
  late String subTitle;
  OnBoardingModel({
    required this.title,
    required this.images,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Title 1",
      images: "assets/icons/onboarding/1.svg",
      subTitle: "SubTitle1"),
  OnBoardingModel(
      title: "Title 2",
      images: "assets/icons/onboarding/2.svg",
      subTitle: "SubTitle2"),
  OnBoardingModel(
      title: "Title 3",
      images: "assets/icons/onboarding/3.svg",
      subTitle: "SubTitle3"),
];
