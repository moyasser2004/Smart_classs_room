import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../shared/const/app_colors.dart';
import '../../../../../shared/styles/app_text_styles.dart';
import 'custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget(
      {super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState
    extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.regular13(context).copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.semiBold11(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.semiBold13(context),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: AppTextStyles.semiBold11(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.semiBold13(context),
                ),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyles.semiBold13(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
