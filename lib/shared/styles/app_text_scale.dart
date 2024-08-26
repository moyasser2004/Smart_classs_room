import 'dart:math';
import 'package:flutter/material.dart';

class AppTextScales {
  static double textScaleFactor(BuildContext context,
      [double maxTextScaleFactor = .9]) {
    final width = MediaQuery.of(context).size.width;
    const double referenceWidth = 1400;
    double val = (width / referenceWidth) * maxTextScaleFactor;

    if (isMobile(context)) {
      // For mobile devices
      return min(max(1.0, val), maxTextScaleFactor);
    } else if (isTablet(context)) {
      // For tablets
      return min(max(1.3, val), maxTextScaleFactor);
    } else {
      // For desktop
      return min(max(1.0, val), maxTextScaleFactor);
    }
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 900;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 900;
  }
}
