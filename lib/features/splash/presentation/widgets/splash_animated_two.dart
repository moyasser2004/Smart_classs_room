import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../shared/styles/app_text_styles.dart';

class SplashScreenAnimatedTwo extends StatelessWidget {
  const SplashScreenAnimatedTwo({
    super.key,
    required bool d,
    required bool c,
    required this.h,
    required this.w,
    required bool b,
    required bool e,
  })  : _d = d,
        _c = c,
        _b = b,
        _e = e;

  final bool _d;
  final bool _c;
  final double h;
  final double w;
  final bool _b;
  final bool _e;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
          seconds: _d
              ? 1
              : _c
                  ? 2
                  : 0),
      curve: Curves.fastLinearToSlowEaseIn,
      height: _d
          ? h
          : _c
              ? 70
              : 20,
      width: _d
          ? w
          : _c
              ? 220
              : 20,
      decoration: BoxDecoration(
          color: _b ? Colors.white : Colors.transparent,
          borderRadius: _d
              ? const BorderRadius.only()
              : BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: _e
              ? AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    FadeAnimatedText(
                      'Smart Classroom',
                      duration: const Duration(milliseconds: 1700),
                      textStyle: AppTextStyles.bold23(context)
                          .copyWith(
                              fontFamily: "LibreBaskerville",
                              fontSize: 22),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
