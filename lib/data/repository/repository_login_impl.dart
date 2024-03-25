import 'package:dr_on_call/data/repository/main_repository.dart';
import 'package:dr_on_call/data/requests/login/login_request.dart';
import 'package:dr_on_call/domain/models/login/login_model.dart';
import 'package:dr_on_call/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/mapper/mapper.dart';
import 'package:dr_on_call/data/network/Failure.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    return executeAndHanldleError<LoginModel>(
        _networkInfo, (await _remoteDataSource.login(loginRequest)).toDomain());
  }

  // @override
  // Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
  //   return executeAndHanldleError<LoginModel>(
  //       _networkInfo, (await _remoteDataSource.login(loginRequest)).toDomain());
  // }
}

//   @override
//   Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         final response = await _remoteDataSource.login(loginRequest);
//         if (response.status == 200) {
//           return Right(response.toDomain());
//         } else {
//           return Left(Failure("", '${response.status}', response.message));
//         }
//       } catch (error) {
//         return Left(ErrorHandler.handle(error).failure);
//       }
//     } else {
//       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//     }
//   }
// }
