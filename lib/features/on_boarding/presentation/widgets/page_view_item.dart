import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../shared/const/constants.dart';
import '../../../../shared/core/services/shared_preferences_singleton.dart';
import '../../../../shared/styles/app_text_styles.dart';
import '../../../auth/presentation/views/signin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subtitle,
      required this.title,
      required this.isVisible});

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;

  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 2 / 1.8,
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    SharedPreferencesHelper.setBool(
                        kIsOnBoardingViewSeen, true);

                    Navigator.of(context).pushReplacementNamed(
                      SignInScreen.routeName,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      style:
                          AppTextStyles.regular13(context).copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 37,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13(context).copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        )
      ],
    );
  }
}
