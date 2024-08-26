import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/const/app_colors.dart';
import '../../../../../shared/styles/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل ؟',
            style: AppTextStyles.semiBold13(context).copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyles.semiBold16(context).copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: 'تسجيل الدخول',
            style: AppTextStyles.semiBold13(context).copyWith(
                color: AppColors.primaryColor, fontSize: 15),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
