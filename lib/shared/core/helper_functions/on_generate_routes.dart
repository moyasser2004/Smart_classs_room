import 'package:flutter/material.dart';
import 'package:iot_class_room/features/profile/presentation/screen/profile_screen.dart';
import 'package:iot_class_room/test_screen.dart';

import '../../../features/auth/presentation/views/signin_view.dart';
import '../../../features/auth/presentation/views/signup_view.dart';
import '../../../features/home/presentation/pages/home/home_screen.dart';
import '../../../features/on_boarding/presentation/screens/on_boarding_view.dart';
import '../../../features/splash/presentation/screens/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
          builder: (context) => const SplashView());
    case SignInScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SignInScreen());
    case SignupView.routeName:
      return MaterialPageRoute(
          builder: (context) => const SignupView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(
          builder: (context) => const OnBoardingView());
    case TestScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const TestScreen());
    case ProfileScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const ProfileScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold());
  }
}
