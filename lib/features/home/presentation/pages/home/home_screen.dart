import 'package:flutter/material.dart';
import 'package:iot_class_room/features/home/presentation/widgets/home_screen_center_widget_main.dart';
import '../../widgets/home_screen_top_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfce2e1), Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 70),
          child: SafeArea(
            child: Column(
              children: [
                const HomeScreenTopWidget(),
                const SizedBox(
                  height: 30,
                ),
                HomeScreenCenterWidget(width: width, height: height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
