import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_class_room/features/profile/presentation/manager/profile_cubit.dart';
import 'package:iot_class_room/features/profile/presentation/widgets/profile_menu_widget.dart';
import 'package:iot_class_room/shared/const/app_colors.dart';
import 'package:iot_class_room/shared/styles/app_text_styles.dart';
import 'package:iot_class_room/shared/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../shared/const/app_images.dart';
import '../../../../shared/core/helper_functions/build_error_bar.dart';
import '../../../../shared/core/services/get_it_service.dart';
import '../../../auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import '../../domain/repositories/profile_repo.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {}
        if (state is ProfileFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return ModalProgressHUD(
              inAsyncCall: state is SignupLoading ? true : false,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 75,
                            backgroundColor: AppColors.greyColor,
                            backgroundImage:
                                AssetImage(AppImages.imagesUser),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 100,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(17.5),
                                color: Colors
                                    .black87, // Replace with tPrimaryColor
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        state.user.name,
                        style: AppTextStyles.semiBold16(context)
                            .copyWith(fontSize: 19),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.user.email,
                        style: AppTextStyles.regular16(context),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onPressed: () async {},
                        text: 'Edit Profile',
                        height: 40,
                        backgroundColor: AppColors.profileColor,
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                        title: "Settings",
                        icon: Icons.settings,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: "Billing Details",
                        icon: Icons.wallet_giftcard,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: "User Management",
                        icon: Icons.group,
                        onPress: () {},
                      ),
                      const Divider(),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                        title: "Information",
                        icon: Icons.info,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: "Delete Account",
                        icon: Icons.info,
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Delete Account"),
                              content: const Text(
                                  "Are you sure you want to Delete Account?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    ProfileCubit(
                                            profileRepo:
                                                getIt<ProfileRepo>())
                                        .deleteProfile(context);
                                  },
                                  child: const Text("Yes"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Dismiss the dialog
                                  },
                                  child: const Text("No"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ProfileMenuWidget(
                        title: "Logout",
                        icon: Icons.logout,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          ProfileCubit(
                                  profileRepo: getIt<ProfileRepo>())
                              .logoutProfile(context);
                        },
                      ),
                    ],
                  ),
                ),
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
