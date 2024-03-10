import 'package:Dr/data/network/network_info.dart';
import 'package:dartz/dartz.dart';

import '../network/Failure.dart';
import '../network/error_handler.dart';

Future<Either<Failure, T>> executeAndHanldleError<T>(
  NetworkInfo _networkInfo,
  Future<T> Function() function,
) async {
  if (await _networkInfo.isConnected) {
    try {
      final response = await function();
     
        return Right(response);
    
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  } else {
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}
