import 'package:flutter/material.dart';

import '../../../../../shared/styles/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFDCDEDE),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          'أو',
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold16(context),
        ),
        const SizedBox(
          width: 18,
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
