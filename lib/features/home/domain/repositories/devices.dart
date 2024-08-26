import 'package:iot_class_room/shared/const/app_images.dart';

import '../entities/device_model.dart';

List<DeviceModel> devices = [
  DeviceModel(
      name: 'Smart Spotlight',
      isActive: true,
      color: "#ff5f5f",
      icon: AppImages.imagesLight),
  DeviceModel(
      name: 'Smart Fan',
      isActive: true,
      color: "#7739ff",
      icon: AppImages.imagesFan),
  DeviceModel(
      name: 'Smart Door In',
      isActive: false,
      color: "#c9c306",
      icon: AppImages.imagesTv),
  DeviceModel(
      name: 'Smart Door Out',
      isActive: false,
      color: "#c207db",
      icon: AppImages.imagesTv),
];
