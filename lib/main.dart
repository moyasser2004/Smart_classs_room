import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_class_room/shared/core/helper_functions/on_generate_routes.dart';
import 'package:iot_class_room/shared/core/services/custom_bloc_observer.dart';
import 'package:iot_class_room/shared/core/services/get_it_service.dart';
import 'package:iot_class_room/shared/styles/app_themes.dart';
import 'features/splash/presentation/screens/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
