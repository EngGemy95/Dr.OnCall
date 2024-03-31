import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/mapper/mapper.dart';
import 'package:dr_on_call/data/repository/main_repository.dart';
import 'package:dr_on_call/domain/models/change_password/change_password_model.dart';

import '../../domain/repository/update_password_repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/Failure.dart';
import '../network/network_info.dart';
import '../requests/update_password/update_password_request.dart';

class UpdatePasswordRepositoryImpl implements UpdatePasswordRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  UpdatePasswordRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, UpdatePasswordModel>> updatePassword(
      UpdatePasswordRequest request) async {
    return executeAndHanldleError<UpdatePasswordModel>(_networkInfo,
        (await _remoteDataSource.updatePassword(request)).toDomain());
  }
}
