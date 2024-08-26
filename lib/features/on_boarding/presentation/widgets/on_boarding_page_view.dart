import 'package:flutter/material.dart';
import 'package:iot_class_room/features/on_boarding/presentation/widgets/page_view_item.dart';

import '../../../../shared/const/app_colors.dart';
import '../../../../shared/const/app_images.dart';
import '../../../../shared/styles/app_text_styles.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: AppImages.imagesRobot,
          backgroundImage:
              AppImages.imagesPageViewItem1BackgroundImage,
          subtitle:
              'اكتشف تجربة تعليمية فريدة مع Smart Classroom. استكشف مجموعتنا الشاملة من الأدوات التعليمية الذكية لتحسين جودة التعليم والحصول على أفضل النتائج.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في',
                style: AppTextStyles.bold23(context),
              ),
              Text(
                '  Smart',
                style: AppTextStyles.bold23(context).copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                ' Classroom',
                style: AppTextStyles.bold23(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const PageViewItem(
          isVisible: false,
          image: AppImages.imagesPhone,
          backgroundImage:
              AppImages.imagesPageViewItem1BackgroundImage,
          subtitle:
              'نقدم لك أدوات تعليمية ذكية مصممة بعناية. اطلع على التفاصيل والصور والتقييمات لتضمن حصولك على تجربة تعليمية مثالية.',
          title: Text(
            'تعلم وتطور',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0C0D0D),
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        )
      ],
    );
  }
}
