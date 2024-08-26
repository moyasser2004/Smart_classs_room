import 'package:flutter/material.dart';
import 'package:iot_class_room/features/splash/presentation/widgets/splash_animated_one.dart';
import 'package:iot_class_room/features/splash/presentation/widgets/splash_animated_two.dart';
import 'package:iot_class_room/shared/core/services/firebase_auth_service.dart';
import 'dart:async';
import '../../../../shared/const/constants.dart';
import '../../../../shared/core/services/shared_preferences_singleton.dart';
import '../../../auth/presentation/views/signin_view.dart';
import '../../../home/presentation/pages/home/home_screen.dart';
import '../../../on_boarding/presentation/screens/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  void _startAnimationSequence() {
    _timer = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
        _b = true;
      });

      Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          _c = true;
        });

        Timer(const Duration(milliseconds: 300), () {
          setState(() {
            _e = true;
          });

          Timer(const Duration(milliseconds: 1400), () {
            setState(() {
              _d = true;
            });

            _navigate();
          });
        });
      });
    });
  }

  void _navigate() async {
    bool isOnBoardingViewSeen =
        SharedPreferencesHelper.getBool(kIsOnBoardingViewSeen);

    String routeName = await FirebaseAuthService.authStateChanges()
        ? HomeScreen.routeName
        : isOnBoardingViewSeen
            ? SignInScreen.routeName
            : OnBoardingView.routeName;

    if (mounted) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height / 1.3;
    double w = MediaQuery.sizeOf(context).width;
    return Center(
      child: Column(
        children: [
          SplashScreenAnimatedOne(d: _d, a: _a, h: h),
          SplashScreenAnimatedTwo(
              d: _d, c: _c, h: h, w: w, b: _b, e: _e),
        ],
      ),
    );
  }
}
