import 'package:Dr/data/requests/login_request.dart';
import 'package:Dr/data/requests/register_request.dart';
import 'package:Dr/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';
import 'package:Dr/app/app_prefs.dart';
import 'package:Dr/data/mapper/mapper.dart';
import 'package:Dr/data/network/Failure.dart';
import '../../domain/repository/register_repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreference _appPreference;

  RegisterRepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreference);

  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == 200) {
          return Right(response.toDomain());
        } else {
          return Left(Failure("error", '${response.status}', response.message));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
