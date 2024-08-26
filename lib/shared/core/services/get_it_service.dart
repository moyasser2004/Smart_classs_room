import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:iot_class_room/features/home/data/repositories/home_repo_implement.dart';
import 'package:iot_class_room/features/home/domain/repositories/home_repo.dart';
import 'package:iot_class_room/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:iot_class_room/shared/core/services/shared_preferences_singleton.dart';

import '../../../features/auth/data/repos/auth_repo_impl.dart';
import '../../../features/auth/domain/repos/auth_repo.dart';
import '../../../features/profile/domain/repositories/profile_repo.dart';
import '../../utils/firebase_options.dart';
import 'data_service.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await Future.wait([
    Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform),
    SharedPreferencesHelper.init(),
  ]);

  // Register services with GetIt
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(
      databaseService: getIt<DatabaseService>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
