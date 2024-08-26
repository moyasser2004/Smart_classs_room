import 'package:flutter/material.dart';

import '../../../../shared/const/app_colors.dart';
import '../../../../shared/styles/app_text_styles.dart';

class ProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return AppBar(
      backgroundColor: AppColors.profileColor,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        'Profile',
        style: AppTextStyles.semiBold16(context)
            .copyWith(fontSize: 20, fontFamily: "LibreBaskerville"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {},
              icon: FittedBox(
                child: Icon(
                    size: 30,
                    isDark ? Icons.wb_sunny : Icons.nightlight_round),
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
