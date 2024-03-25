import 'package:dr_on_call/data/repository/main_repository.dart';
import 'package:dr_on_call/data/requests/register_request.dart';
import 'package:dr_on_call/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/mapper/mapper.dart';
import 'package:dr_on_call/data/network/Failure.dart';
import '../../domain/repository/register_repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RegisterRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return executeAndHanldleError<RegisterModel>(_networkInfo,
        (await _remoteDataSource.register(registerRequest)).toDomain());
  }

  // @override
  // Future<Either<Failure, RegisterModel>> register(
  //     RegisterRequest registerRequest) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.register(registerRequest);
  //       if (response.status == 200) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure("error", '${response.status}', response.message));
  //       }
  //     } catch (error) {
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     return Left(DataSource.noInternetConnection.getFailure());
  //   }
  // }
}
