import 'package:flutter/material.dart';
import 'package:iot_class_room/shared/styles/app_text_styles.dart';

import '../../../../shared/widgets/transparent_card.dart';

class SpeedWidget extends StatelessWidget {
  final int speed;
  final Function(int) changeSpeed;

  const SpeedWidget(
      {super.key, required this.speed, required this.changeSpeed});

  @override
  Widget build(BuildContext context) {
    return TransparentCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 1,
          ),
          Text(
            "Speed",
            style: AppTextStyles.bold20(context),
          ),
          const SizedBox(
            height: 5,
          ),
          _button(0, speed == 0),
          _button(1, speed == 1),
          _button(2, speed == 2),
          _button(3, speed == 3),
          const SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }

  ElevatedButton _button(int speed, bool isActive) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: isActive ? Colors.black : Colors.white,
          backgroundColor:
              isActive ? Colors.white : Colors.transparent,
          minimumSize: const Size(50, 50),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          side: BorderSide(color: Colors.white.withOpacity(0.4)),
          elevation: 0),
      onPressed: () => changeSpeed(speed),
      child: Text(speed.toString()),
    );
  }
}
