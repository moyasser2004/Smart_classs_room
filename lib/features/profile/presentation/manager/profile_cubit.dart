import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:iot_class_room/features/auth/presentation/views/signin_view.dart';
import 'package:iot_class_room/features/profile/domain/entities/user_entities.dart';
import 'package:iot_class_room/features/profile/domain/repositories/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  Future<void> getProfileData({required String uid}) async {
    emit(ProfileLoading());
    final result = await profileRepo.getUserProfile(uid);
    result.fold(
      (failure) => emit(ProfileFailure(message: failure.message)),
      (profileEntity) => emit(ProfileSuccess(user: profileEntity)),
    );
  }

  Future<void> updateProfileData(
      {required String email,
      required String imageUrl,
      required String name,
      required String uid}) async {
    emit(ProfileLoading());
    final result = await profileRepo.updateUserImage(
      imageUrl,
      email,
      name,
      uid,
    );
    result.fold(
        (failure) =>
            emit(ProfileUpdateFailure(message: failure.message)),
        (profileEntity) {
      emit(ProfileUpdateSuccess());
      getProfileData(uid: uid);
    });
  }

  Future<void> deleteProfile(BuildContext context) async {
    emit(ProfileDeleteLoading());
    final result = await profileRepo.deleteAccount();
    result.fold(
      (failure) => emit(ProfileDeleteFailure()),
      (profileEntity) {
        emit(ProfileDeleteSuccess());
        Navigator.pushReplacementNamed(
            context, SignInScreen.routeName);
      },
    );
  }

  Future<void> logoutProfile(BuildContext context) async {
    emit(ProfileLogoutLoading());
    final result = await profileRepo.logout();
    result.fold(
      (failure) => emit(ProfileLogoutFailure()),
      (profileEntity) {
        emit(ProfileLogoutSuccess());
        Navigator.pushReplacementNamed(
            context, SignInScreen.routeName);
      },
    );
  }
}
