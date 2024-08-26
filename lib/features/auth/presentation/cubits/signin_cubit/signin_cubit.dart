import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_class_room/shared/core/services/shared_preferences_singleton.dart';

import '../../../domain/entites/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SigninState> {
  SignInCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) {
        SharedPreferencesHelper.setString("uid", userEntity.uId);
        SharedPreferencesHelper.setString(
            "name", email.split("@")[0]);
        emit(SigninSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
        (failure) => emit(SigninFailure(message: failure.message)),
        (userEntity) {
      SharedPreferencesHelper.setString("uid", userEntity.uId);
      SharedPreferencesHelper.setString("name", userEntity.name);
      emit(SigninSuccess(userEntity: userEntity));
    });
  }
}
