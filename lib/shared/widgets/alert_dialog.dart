import 'package:flutter/material.dart';
import 'package:iot_class_room/shared/styles/app_text_styles.dart';

import '../const/app_colors.dart';

class CustomDialog extends StatelessWidget {
  final String title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback positiveBtnPressed;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.positiveBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          // Bottom rectangular box
          margin: const EdgeInsets.only(
              top: 40), // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: AppTextStyles.bold23(context).copyWith(
                    color: AppColors.whiteRed, fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                content,
                style: AppTextStyles.semiBold16(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.black,
          maxRadius: 40.0,
          child: Icon(Icons.local_fire_department_sharp,
              size: 50, color: Colors.red),
        ),
      ],
    );
  }
}
