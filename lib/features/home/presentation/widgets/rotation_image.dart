import 'package:flutter/material.dart';
import 'package:iot_class_room/shared/const/app_images.dart';
import 'package:svg_flutter/svg.dart';

class RotationImage extends StatefulWidget {
  const RotationImage({super.key});

  @override
  State<RotationImage> createState() => _RotationImageState();
}

class _RotationImageState extends State<RotationImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animation = Tween<double>(begin: 10, end: 1).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: animation,
        child: SvgPicture.asset(
          width: 200,
          height: 200,
          AppImages.imagesFan,
        ),
      ),
    );
  }
}
