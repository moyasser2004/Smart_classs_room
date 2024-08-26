import 'package:flutter/material.dart';
import 'app_text_scale.dart';

abstract class AppTextStyles {
  static TextStyle bold13(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppTextScales.textScaleFactor(context) * 13,
      );

  static TextStyle bold23(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppTextScales.textScaleFactor(context) * 23,
      );

  static TextStyle semiBold13(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: AppTextScales.textScaleFactor(context) * 13,
      );

  static TextStyle regular13(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: AppTextScales.textScaleFactor(context) * 13,
      );

  static TextStyle bold16(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppTextScales.textScaleFactor(context) * 16,
      );

  static TextStyle bold20(BuildContext context) => TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        fontSize: AppTextScales.textScaleFactor(context) * 20,
      );

  static TextStyle bold19(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppTextScales.textScaleFactor(context) * 19,
      );

  static TextStyle semiBold16(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: AppTextScales.textScaleFactor(context) * 16,
      );

  static TextStyle bold28(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppTextScales.textScaleFactor(context) * 28,
      );

  static TextStyle regular22(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: AppTextScales.textScaleFactor(context) * 22,
      );

  static TextStyle semiBold11(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: AppTextScales.textScaleFactor(context) * 11,
      );

  static TextStyle medium15(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: AppTextScales.textScaleFactor(context) * 15,
      );

  static TextStyle regular26(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: AppTextScales.textScaleFactor(context) * 26,
      );

  static TextStyle regular16(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: AppTextScales.textScaleFactor(context) * 16,
      );

  static TextStyle regular11(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: AppTextScales.textScaleFactor(context) * 11,
      );
  static TextStyle semiBold14(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: AppTextScales.textScaleFactor(context) * 14,
      );
}
