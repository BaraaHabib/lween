import 'package:get_it/get_it.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/services/files/file_manager.dart';
import 'package:lween/core/services/notification_service.dart';
import 'package:lween/features/auth/bloc/account_bloc.dart';
import 'package:lween/features/auth/repo/account_repository.dart';
import 'package:lween/features/home/bloc/home_bloc.dart';
import 'package:lween/features/home/repo/account_repository.dart';
import 'package:lween/features/notifications/bloc/notifications_bloc.dart';
import 'package:lween/features/notifications/repo/repo_repository.dart';
import 'package:lween/features/onboarding/bloc/splash_bloc.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/repo/orders_repository.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/repo/transportation_entities_repository.dart';

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
  sl.registerLazySingleton(() => HomeBloc());
  sl.registerLazySingleton(() => OrdersBloc());
  sl.registerLazySingleton(() => CompanyBloc());
  sl.registerLazySingleton(() => NotificationsBloc());


  sl.registerLazySingleton(() => AppStateModel());

  //! repos
  sl.registerLazySingleton(() => AccountRepository(sl()));
  sl.registerLazySingleton(() => HomeRepository(sl()));
  sl.registerLazySingleton(() => OrdersRepository(sl()));
  sl.registerLazySingleton(() => CompaniesRepository(sl()));
  sl.registerLazySingleton(() => NotificationsRepository(sl()));

  //! data sources
  sl.registerLazySingleton(() => RemoteDataSource());

  //! Core
  sl.registerLazySingleton(() => LocaleProvider());

  //! External

  sl.registerLazySingleton(() => FileManager());
  sl.registerLazySingleton(() => NotificationService());


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
