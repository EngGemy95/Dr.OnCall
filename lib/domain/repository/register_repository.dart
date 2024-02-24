import 'package:Dr_OnCall/data/requests/register_request.dart';
import 'package:Dr_OnCall/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest);
}
