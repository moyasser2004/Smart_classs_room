import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../pages/control_page/control_panel_page.dart';

class Devices extends StatelessWidget {
  final String name;
  final String svg;
  final Color color;
  final bool isActive;
  final int value;
  final Function(bool) onChanged;

  const Devices(
      {super.key,
      required this.name,
      required this.svg,
      required this.color,
      required this.onChanged,
      required this.isActive,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: const Duration(milliseconds: 500),
        closedElevation: 0,
        openElevation: 0,
        openShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        openBuilder: (BuildContext context, VoidCallback _) {
          // navigate to control page
          return ControlPanelPage(
            tag: name,
            color: color,
            isActive: isActive,
            value: value,
          );
        },
        tappable: true,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 0.6,
              ),
              color: isActive ? color : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        svg,
                        color: isActive ? Colors.white : Colors.black,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          name,
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 12,
                              color: isActive
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    alignment: Alignment.center,
                    scaleY: 0.9,
                    scaleX: 0.85,
                    child: CupertinoSwitch(
                      onChanged: onChanged,
                      value: isActive,
                      activeColor: isActive
                          ? Colors.white.withOpacity(0.4)
                          : Colors.black,
                      trackColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
