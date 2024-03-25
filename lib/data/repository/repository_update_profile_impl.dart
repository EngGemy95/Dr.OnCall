import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/data_source/remote_data_source.dart';
import 'package:dr_on_call/data/mapper/mapper.dart';
import 'package:dr_on_call/data/network/Failure.dart';
import 'package:dr_on_call/data/network/network_info.dart';
import 'package:dr_on_call/data/repository/main_repository.dart';
import 'package:dr_on_call/domain/models/profile_model.dart';
import 'package:dr_on_call/domain/repository/profile_repository.dart';

class RepositoryUpdateProfileImpl implements ProfileRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryUpdateProfileImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ProfileModel>> updateProfile({
    required String name,
    required String gender,
    String? bloodType,
    String? phone,
    File? image,
  }) async {
    return executeAndHanldleError<ProfileModel>(
        networkInfo,
        (await remoteDataSource.updateProfile(
          name: name,
          gender: gender,
          phone: phone,
          bloodType: bloodType,
          image: image,
        ))
            .toDomain());
  }
}
