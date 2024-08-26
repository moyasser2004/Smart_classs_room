import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../shared/const/constants.dart';
import '../../../../shared/core/services/shared_preferences_singleton.dart';
import '../../../../shared/const/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../auth/presentation/views/signin_view.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() =>
      _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 720
        ? 720
        : MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height / 1.06,
        child: Column(
          children: [
            Expanded(
              child: OnBoardingPageView(
                pageController: pageController,
              ),
            ),
            DotsIndicator(
              dotsCount: 2,
              decorator: DotsDecorator(
                  activeColor: AppColors.primaryColor,
                  color: currentPage == 0
                      ? AppColors.secondaryColor
                      : AppColors.onBoardingColor),
            ),
            const SizedBox(
              height: 29,
            ),
            Visibility(
              visible: currentPage == 1 ? true : false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizintalPadding,
                ),
                child: CustomButton(
                  onPressed: () {
                    SharedPreferencesHelper.setBool(
                        kIsOnBoardingViewSeen, true);
                    Navigator.of(context).pushReplacementNamed(
                      SignInScreen.routeName,
                    );
                  },
                  text: 'ابدأ الان',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
