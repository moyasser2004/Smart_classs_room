import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.height = 54,
      this.backgroundColor = AppColors.primaryColor});

  final VoidCallback onPressed;
  final String text;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.semiBold16(context).copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
