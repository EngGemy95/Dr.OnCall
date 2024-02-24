import 'package:Dr_OnCall/data/repository/repository_login_impl.dart';
import 'package:Dr_OnCall/domain/repository/login_repository.dart';
import 'package:Dr_OnCall/domain/usecase/login_usecase.dart';
import 'package:Dr_OnCall/domain/usecase/register_usecase.dart';
import 'package:Dr_OnCall/presentation/bloc/Login/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_register_impl.dart';
import '../domain/repository/register_repository.dart';
import '../presentation/bloc/password/password_visibility_bloc.dart';
import './app_prefs.dart';

final instance = GetIt.instance;

// We put async because the shared prefs require await for Future
Future<void> initAppModule() async {
  // App Module , it is a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(sharedPrefs));

  // dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  // App Service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Data Source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // Repositoy instance
  instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(instance(), instance(), instance()));

  instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(instance(), instance(), instance()));

// Bloc instance
  instance.registerFactory(() => SignInBloc(loginUseCase: instance()));
  instance.registerFactory(() => PasswordVisibilityBloc());

  // UseCases instance

  instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(instance()));

  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
}

// unRegisterAll() {
//   instance.unregister<SharedPreferences>();
//   instance.unregister<AppPreference>();
//   instance.unregister<DioFactory>();
//   instance.unregister<AppServiceClient>();
//   instance.unregister<RemoteDataSource>();
//   instance.unregister<RegisterRepository>();
//   instance.unregister<NetworkInfo>();
//   instance.unregister<RegisterUseCase>();
// }
