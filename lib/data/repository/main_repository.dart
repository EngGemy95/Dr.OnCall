import 'package:dr_on_call/data/network/network_info.dart';
import 'package:dartz/dartz.dart';

import '../network/Failure.dart';
import '../network/error_handler.dart';

Future<Either<Failure, T>> executeAndHanldleError<T>(
  NetworkInfo _networkInfo,
  T,
) async {
  if (await _networkInfo.isConnected) {
    try {
      final response = T;
      return Right(response);
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  } else {
    return Left(DataSource.noInternetConnection.getFailure());
  }
}
