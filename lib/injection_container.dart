import 'package:get_it/get_it.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/services/files/file_manager.dart';
import 'package:lween/features/auth/bloc/account_bloc.dart';
import 'package:lween/features/auth/repo/account_repository.dart';
import 'package:lween/features/onboarding/bloc/splash_bloc.dart';

import 'core/storage/hive/app_storage.dart';

final sl = GetIt.instance;
bool servicesInjected = false;
void initInjection() {
  if (servicesInjected) {
    return;
  }

  //storage
  sl.registerLazySingleton(() => AppStorage());

  //Bloc
  sl.registerLazySingleton(() => AccountBloc());
  sl.registerLazySingleton(() => SplashBloc());
  sl.registerLazySingleton(() => AppStateModel());

  //! repos
  sl.registerLazySingleton(() => AccountRepository(sl()));

  //! data sources
  sl.registerLazySingleton(() => RemoteDataSource());

  //! Core
  sl.registerLazySingleton(() => LocaleProvider());

  //! External

  sl.registerLazySingleton(() => FileManager());


  //!
  servicesInjected = true;
}

Future<void> resetInjection() async {
  await sl.reset(
    dispose: true,
  );
  servicesInjected = false;
  initInjection();
}
