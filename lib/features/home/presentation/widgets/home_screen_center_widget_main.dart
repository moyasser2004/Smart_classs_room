import 'package:flutter/material.dart';
import 'home_screen_center_widget.dart';

class HomeScreenCenterWidget extends StatelessWidget {
  const HomeScreenCenterWidget(
      {super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4 devices added",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Class Room",
                        style: TextStyle(
                            height: 1.1,
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: HomeScreenCenterContainerUtils(
                  width: width,
                  height: height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
