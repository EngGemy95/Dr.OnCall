import 'package:Dr/data/requests/login_request.dart';
import 'package:Dr/domain/models/login_model.dart';
import 'package:Dr/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:Dr/app/app_prefs.dart';
import 'package:Dr/data/mapper/mapper.dart';
import 'package:Dr/data/network/Failure.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';
import '../response/login_response.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreference _appPreference;

  LoginRepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreference);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == 200) {
          return Right(response.toDomain());
        } else {
          return Left(Failure("", '${response.status}', response.message));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
