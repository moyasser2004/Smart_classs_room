import 'package:flutter/material.dart';
import 'package:iot_class_room/shared/widgets/string_to_color.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../shared/const/app_colors.dart';
import '../../../../shared/const/app_images.dart';
import '../../../../shared/core/helper_functions/build_error_bar.dart';
import '../../../../shared/core/services/firebase_real_time_data_service.dart';
import '../../../../shared/styles/app_text_styles.dart';
import '../../../../shared/widgets/fire_dialog.dart';
import '../../data/repositories/home_repo_implement.dart';
import '../../domain/repositories/devices.dart';
import '../../domain/repositories/home_repo.dart';
import 'devices.dart';

class HomeScreenCenterContainerUtils extends StatefulWidget {
  const HomeScreenCenterContainerUtils(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;

  static const routeName = '/home/center';

  @override
  State<HomeScreenCenterContainerUtils> createState() =>
      _HomeScreenCenterContainerUtilsState();
}

class _HomeScreenCenterContainerUtilsState
    extends State<HomeScreenCenterContainerUtils> {
  int light = 0;
  int humidity = 0;

  int temperature = 0;
  int counter = 0;
  int fire = 0;
  int fan = 0;

  int doorIn = 0;
  int doorOut = 0;

  late HomeRepo lightState;
  late HomeRepo homeHumidity;
  late HomeRepo homeTemperature;

  late HomeRepo homeUltraSonic;
  late HomeRepo homeFlame;

  late HomeRepo homeDoorIn;
  late HomeRepo homeDoorOut;

  late HomeRepo homeFan;

  // in this ui we use state full widget to listen to firebase real time data
  // and update the ui accordingly.
  @override
  void initState() {
    // to listen to light state,
    lightState = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Light/degree_1'),
    );
    lightState.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          setState(() {
            // update light value
            light = data;
          });
        },
      );
    });

    // to listen to humidity,
    homeHumidity = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Humidity/degree'),
    );
    homeHumidity.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          setState(() {
            // update humidity value
            humidity = data;
          });
        },
      );
    });

    // to listen to temperature,
    homeTemperature = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Temperature/degree'),
    );
    homeTemperature.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          setState(() {
            // update temperature value
            temperature = data;
          });
        },
      );
    });

    // to listen to ultra sonic count,
    homeUltraSonic = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('altra/count'),
    );
    homeUltraSonic.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          setState(() {
            // update counter value
            counter = data;
          });
        },
      );
    });

    // to listen to flame fire state,
    homeFlame = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('flame/fire'),
    );
    homeFlame.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          setState(() {
            fire = data;
            if (fire == 0) {
              // in this case show fire warning dialog
              showFireWarningDialog(context);
            }
          });
        },
      );
    });

    // to listen to door in state,
    homeDoorIn = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Door/in'),
    );
    homeDoorIn.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          // update door in value
          setState(() {
            doorIn = data;
          });
        },
      );
    });

    // to listen to door out state,
    homeDoorOut = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Door/out'),
    );
    homeDoorOut.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          // update door out value
          setState(() {
            doorOut = data;
          });
        },
      );
    });

    // to listen to fan degree,
    homeFan = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Fan/degree'),
    );
    homeFan.getHomeDataStream().listen((result) {
      result.fold(
        (failure) => buildErrorBar(context, failure.message),
        (data) {
          // update fan value
          setState(() {
            fan = data;
          });
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3.9,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
            itemCount: devices.length,
            itemBuilder: (BuildContext ctx, index) {
              if (devices[index].name == "Smart Spotlight") {
                devices[index].isActive = light == 0 ? false : true;
              }

              if (devices[index].name == "Smart Door In") {
                devices[index].isActive = doorIn == 0 ? false : true;
              }

              if (devices[index].name == "Smart Door Out") {
                devices[index].isActive = doorOut == 0 ? false : true;
              }

              if (devices[index].name == "Smart Fan") {
                devices[index].isActive = fan == 0 ? false : true;
              }

              return Devices(
                value: devices[index].name == "Smart Spotlight"
                    ? light
                    : fan,
                name: devices[index].name,
                svg: devices[index].icon,
                color: devices[index].color.toColor(),
                isActive: devices[index].isActive,
                onChanged: (val) async {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  // in this case add firebase logic to update device status
                  setState(() {
                    devices[index].isActive =
                        !devices[index].isActive;
                  });

                  switch (devices[index].name) {
                    case "Smart Spotlight":
                      await lightState.updateHomeData(
                          devices[index].isActive ? 1 : 0);
                      break;
                    case "Smart Door In":
                      await homeDoorIn.updateHomeData(
                          devices[index].isActive ? 180 : 0);
                      break;
                    case "Smart Door Out":
                      await homeDoorOut.updateHomeData(
                          devices[index].isActive ? 180 : 0);
                      break;
                    case "Smart Fan":
                      await homeFan.updateHomeData(
                          devices[index].isActive ? 1 : 0);
                      break;
                    default:
                      buildErrorBar(
                          context, "Error updating device status");
                      break;
                  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                },
              );
            }),
        SizedBox(
          height: 90,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: widget.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black,
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                            height: 40,
                            width: 50,
                            color: AppColors.profileColor,
                            AppImages.imagesStudentIcon),
                        Text(
                          "Student : $counter",
                          style: AppTextStyles.semiBold16(context)
                              .copyWith(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: widget.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                                height: 20,
                                width: 20,
                                color: AppColors.profileColor,
                                AppImages.imagesSnow),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Temperature : $temperature",
                              style: AppTextStyles.semiBold16(context)
                                  .copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              "Humidity : $humidity",
                              style: AppTextStyles.semiBold16(context)
                                  .copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
