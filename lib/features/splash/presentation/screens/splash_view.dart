import 'package:flutter/material.dart';

import '../../../../shared/const/app_colors.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: AppBar(
        backgroundColor: AppColors.splashColor,
      ),
      body: const SplashViewBody(),
    );
  }
}
