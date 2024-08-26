import 'package:flutter/material.dart';
import 'alert_dialog.dart';

void showFireWarningDialog(BuildContext context) {
  showGeneralDialog(
    barrierDismissible: false,
    context: context,
    barrierColor: Colors.black54, // space around dialog
    transitionDuration: const Duration(milliseconds: 800),
    transitionBuilder: (context, a1, a2, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: a1,
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeOutCubic,
        ),
        child: CustomDialog(
          // Our custom dialog for fire warning
          title: "Fire Alert!",
          content:
              "A fire has been detected in the vicinity. Please evacuate immediately and follow safety protocols.",
          positiveBtnText: "Acknowledge",
          negativeBtnText: "Cancel",
          positiveBtnPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    },
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return const SizedBox();
    },
  );
}
