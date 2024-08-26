import 'package:flutter/material.dart';

class SplashScreenAnimatedOne extends StatelessWidget {
  const SplashScreenAnimatedOne({
    super.key,
    required bool d,
    required bool a,
    required this.h,
  })  : _d = d,
        _a = a;

  final bool _d;
  final bool _a;
  final double h;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: _d ? 900 : 2500),
      curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
      height: _d
          ? 0
          : _a
              ? h / 2
              : 15,
      width: 20,
    );
  }
}
