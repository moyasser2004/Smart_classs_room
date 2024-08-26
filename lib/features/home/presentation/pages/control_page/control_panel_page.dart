import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:iot_class_room/features/home/domain/repositories/home_repo.dart';
import 'package:iot_class_room/shared/const/app_images.dart';

import 'package:rainbow_color/rainbow_color.dart';

import '../../../../../shared/core/helper_functions/options_enum.dart';
import '../../../../../shared/core/services/firebase_real_time_data_service.dart';
import '../../../../../shared/widgets/custom_appbar.dart';
import '../../../../../shared/widgets/slider_utils.dart';
import '../../../data/repositories/home_repo_implement.dart';
import '../../widgets/lottie_door.dart';
import '../../widgets/option_widget.dart';
import '../../widgets/rotation_image.dart';
import '../../widgets/slider/slider_widget.dart';
import '../../widgets/speed_widget.dart';
import '../../widgets/temp_widget.dart';

class ControlPanelPage extends StatefulWidget {
  final String tag;
  final Color color;
  final bool isActive;
  final int value;

  const ControlPanelPage(
      {super.key,
      required this.tag,
      required this.color,
      required this.isActive,
      required this.value});

  @override
  State<ControlPanelPage> createState() => _ControlPanelPageState();
}

class _ControlPanelPageState extends State<ControlPanelPage>
    with TickerProviderStateMixin {
  Options option = Options.cooling;
  bool isActive = false;
  int speed = 1;
  double temp = 22.85;
  double progressVal = 0.49;

  HomeRepo? lightState;

  HomeRepo? fanState;

  Rainbow activeColor = Rainbow(spectrum: [
    const Color(0xFF33C0BA),
    const Color(0xFF1086D4),
    const Color(0xFF6D04E2),
    const Color(0xFFC421A0),
    const Color(0xFFE4262F)
  ], rangeStart: 0.0, rangeEnd: 1.0);

  @override
  void initState() {
    lightState = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Light/degree_1'),
    );

    fanState = HomeRepositoryImplement(
      firebaseRealTimeDataService:
          FirebaseRealTimeDataService<int>('Fan/degree'),
    );

    progressVal = normalize(widget.value, kMinDegree, kMaxDegree);
    speed = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    isActive = widget.isActive;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.white,
                activeColor[progressVal].withOpacity(0.5),
                activeColor[progressVal]
              ]),
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
            baseColor: const Color(0xFFFFFFFF),
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.3,
            spawnMinSpeed: speed * 60.0,
            spawnMaxSpeed: speed * 120,
            spawnMinRadius: 2.0,
            spawnMaxRadius: 5.0,
            particleCount: isActive ? speed * 150 : 0,
          )),
          vsync: this,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  CustomAppBar(title: widget.tag),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        options(name: widget.tag),
                        Visibility(
                          visible: widget.tag == "Smart Spotlight" ||
                              widget.tag == "Smart Sound",
                          child: slider(name: widget.tag),
                        ),
                        Visibility(
                          visible: widget.tag == "Smart Fan",
                          child:
                              const Expanded(child: RotationImage()),
                        ),
                        Visibility(
                            visible: widget.tag == "Smart Door In",
                            child: Expanded(
                              child: LottieDoor(
                                isOpen: widget.isActive,
                              ),
                            )),
                        Visibility(
                            visible: widget.tag == "Smart Door Out",
                            child: Expanded(
                              child: LottieDoor(
                                isOpen: widget.isActive,
                              ),
                            )),
                        controls(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget options({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OptionWidget(
          icon: AppImages.imagesLight,
          isSelected: name == "Smart Spotlight",
          onTap: () {},
          size: 30,
        ),
        OptionWidget(
          icon: AppImages.imagesFan,
          isSelected: name == "Smart Fan",
          onTap: () {},
          size: 30,
        ),
        OptionWidget(
          icon: AppImages.imagesTv,
          isSelected: name == "Smart Door",
          onTap: () {},
          size: 30,
        ),
        OptionWidget(
          icon: AppImages.imagesSpeaker,
          isSelected: name == "Smart Sound",
          onTap: () {},
          size: 30,
        ),
      ],
    );
  }

  Widget slider({required String name}) {
    return SliderWidget(
      progressVal: progressVal,
      color: activeColor[progressVal],
      onChange: (value) {
        setState(() {
          temp = value;
          progressVal = normalize(value, kMinDegree, kMaxDegree);
        });
      },
    );
  }

  Widget controls() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: widget.tag == "Smart Fan",
              child: Expanded(
                  child: SpeedWidget(
                      speed: isActive ? speed : 0,
                      // this change the speed from the firebase for smart fan
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      changeSpeed: (val) => setState(() {
                            print("---------------change $val");
                            if (isActive) {
                              fanState!.updateHomeData(val);
                            } else {
                              Navigator.pop(context);
                            }
                            speed = val;
                          }))
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ),
            ),
            Visibility(
              visible: widget.tag == "Smart Fan",
              child: const SizedBox(
                width: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Visibility(
          visible: widget.tag == "Smart Spotlight",
          child: TempWidget(
            temp: temp,
            changeTemp: (val) {
              setState(() {
                temp = val;
                progressVal = normalize(val, kMinDegree, kMaxDegree);
              });
            },
            // in this case, we change the degree from firebase  for samrt spotlight  and smart sound
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            changeEnd: (double value) async {
              if (widget.tag == "Smart Spotlight") {
                await lightState!.updateHomeData(value.round());
              }
              if (isActive) {
              } else {
                if (mounted) {
                  Navigator.pop(context);
                }
              }
            },
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
