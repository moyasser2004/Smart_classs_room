import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/core/services/get_it_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body_bloc_consumer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt.get<AuthRepo>(),
      ),
      child: const Scaffold(
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
