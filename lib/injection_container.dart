import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_test/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_bloc.dart';
import 'package:mobile_app_test/features/lesson/domain/usecase/get_all_session_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/data_sources/auth_local_data_source.dart';
import 'features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/home/presentation/screens/session_block/session_bloc.dart';
import 'features/lesson/data/data_sources/session_remote_data_source.dart';
import 'features/lesson/data/repository/session_repository_impl.dart';
import 'features/lesson/domain/repository/session_repository.dart';
import 'features/navigation/presentation/screens/navigation_screen/navigation_block.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  sl.registerFactory(() async => await SharedPreferences.getInstance());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => NavigationBlock());
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  sl.registerFactory(() => RegistrationBloc(registerUsecase: sl()));
  sl.registerFactory(() => SessionBloc(getAllSessionUsecase: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => GetAllSessionUsecase(sessionRepository: sl()));
  sl.registerLazySingleton(() => LoginUsecase(authRepository: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: sl(), authLocalDataSource: sl()));

  sl.registerLazySingleton<SessionRemoteDataSource>(
      () => SessionRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl(
      sessionRemoteDataSource: sl(), authLocalDataSource: sl()));
}
