import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/core/services/get_it_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signup_cubits/signup_cubit.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: const Scaffold(
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
