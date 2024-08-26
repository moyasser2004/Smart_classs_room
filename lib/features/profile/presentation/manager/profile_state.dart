part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileEntities user;
  ProfileSuccess({required this.user});
}

final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure({required this.message});
}

final class ProfileUpdateLoading extends ProfileState {}

final class ProfileUpdateSuccess extends ProfileState {}

final class ProfileUpdateFailure extends ProfileState {
  final String message;
  ProfileUpdateFailure({required this.message});
}

final class ProfileDeleteLoading extends ProfileState {}

final class ProfileDeleteSuccess extends ProfileState {}

final class ProfileDeleteFailure extends ProfileState {}

final class ProfileLogoutLoading extends ProfileState {}

final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileLogoutFailure extends ProfileState {}
