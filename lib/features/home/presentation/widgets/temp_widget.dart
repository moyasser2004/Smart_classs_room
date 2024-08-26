import 'package:flutter/material.dart';
import 'package:iot_class_room/shared/styles/app_text_styles.dart';
import 'package:iot_class_room/shared/widgets/slider_utils.dart';

import '../../../../shared/widgets/transparent_card.dart';

class TempWidget extends StatelessWidget {
  final double temp;
  final Function(double) changeTemp;
  final Function(double) changeEnd;

  const TempWidget({
    super.key,
    required this.temp,
    required this.changeTemp,
    required this.changeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TransparentCard(
        child: Row(
          children: [
            Text(
              "Degree",
              style: AppTextStyles.bold20(context),
            ),
            Expanded(
              child: Slider(
                min: kMinDegree,
                max: kMaxDegree,
                value: temp,
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                onChanged: changeTemp,
                onChangeEnd: changeEnd,
                divisions: 84, // Number of discrete divisions
                label:
                    temp.toStringAsFixed(1), // Show the current value
              ),
            ),
          ],
        ),
      ),
    );
  }
}
