import 'package:blood_donation/data/repository/repository_login_impl.dart';
import 'package:blood_donation/domain/repository/login_repository.dart';
import 'package:blood_donation/domain/usecase/login_usecase.dart';
import 'package:blood_donation/domain/usecase/register_usecase.dart';
import 'package:blood_donation/presentation/bloc/authenticate/authenticate_bloc.dart';
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

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // Repositoy instance
  instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(instance(), instance(), instance()));

  instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(instance(), instance(), instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

// Bloc

  instance.registerFactory(() => AuthenticateBloc(loginUseCase: instance()));

  // UseCases
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    //GetMoviesUseCase instance
    instance
        .registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    //GetMoviesUseCase instance
    instance.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(instance()));
  }
}

unRegisterAll() {
  instance.unregister<SharedPreferences>();
  instance.unregister<AppPreference>();
  instance.unregister<DioFactory>();
  instance.unregister<AppServiceClient>();
  instance.unregister<RemoteDataSource>();
  instance.unregister<RegisterRepository>();
  instance.unregister<NetworkInfo>();
  instance.unregister<RegisterUseCase>();
}

// initMoviesModule() async {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     //GetMoviesUseCase instance
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//   }
// }
