import 'package:flutter/material.dart';
import 'package:iot_class_room/features/home/domain/repositories/home_repo.dart';

import '../../../../shared/const/app_images.dart';
import '../../../../shared/core/helper_functions/build_error_bar.dart';
import '../../../../shared/core/services/firebase_real_time_data_service.dart';
import '../../../../shared/core/services/shared_preferences_singleton.dart';
import '../../../profile/presentation/screen/profile_screen.dart';
import '../../data/repositories/home_repo_implement.dart';

class HomeScreenTopWidget extends StatefulWidget {
  const HomeScreenTopWidget({super.key});

  @override
  State<HomeScreenTopWidget> createState() =>
      _HomeScreenTopWidgetState();
}

class _HomeScreenTopWidgetState extends State<HomeScreenTopWidget> {
  bool isDarkMode = true;

  late HomeRepo lightState;

  @override
  void initState() {
    lightState = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Light/degree'),
    );
    lightState.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          setState(() {
            if (data > 60) {
              isDarkMode = false;
            } else {
              isDarkMode = true;
            }
          });
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text(
              "Hi,",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "${SharedPreferencesHelper.getString("name").toString().substring(0, 7)}...",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: IconButton(
                onPressed: () {},
                icon: FittedBox(
                    child: isDarkMode
                        ? const Icon(
                            size: 30,
                            Icons.nightlight_round,
                            color: Colors.black,
                          )
                        : const Icon(
                            size: 30,
                            Icons.wb_sunny,
                            color: Colors.orangeAccent,
                          )),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            Navigator.pushNamed(context, ProfileScreen.routeName);
          },
          child: const CircleAvatar(
              minRadius: 25,
              backgroundImage: AssetImage(AppImages.imagesUser)),
        )
      ],
    );
  }
}
