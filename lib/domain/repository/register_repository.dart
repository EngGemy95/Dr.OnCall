import 'package:Dr/data/requests/register_request.dart';
import 'package:Dr/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest);
}
