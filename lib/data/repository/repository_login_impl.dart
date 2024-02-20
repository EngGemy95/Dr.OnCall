import 'package:blood_donation/data/requests/login_request.dart';
import 'package:blood_donation/domain/models/api_model.dart';
import 'package:blood_donation/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:blood_donation/app/app_prefs.dart';
import 'package:blood_donation/data/mapper/mapper.dart';
import 'package:blood_donation/data/network/Failure.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreference _appPreference;

  LoginRepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreference);

  @override
  Future<Either<Failure, ApiModel>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.code == 200) {
          return Right(response.toDomain());
        } else {
          return Left(Failure("error", ResponseCode.NO_INTERNET_CONNECTION,
              ResponseMessage.noInternetConncention));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
