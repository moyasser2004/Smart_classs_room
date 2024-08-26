import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_class_room/shared/core/services/shared_preferences_singleton.dart';

import '../../../../shared/core/services/get_it_service.dart';
import '../../domain/repositories/profile_repo.dart';
import '../manager/profile_cubit.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(profileRepo: getIt<ProfileRepo>())
            ..getProfileData(
                uid: SharedPreferencesHelper.getString("uid")),
      child: const Scaffold(
        appBar: ProfileAppBar(),
        body: ProfileBody(),
      ),
    );
  }
}
