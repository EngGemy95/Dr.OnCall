import 'package:dr_on_call/data/requests/register_request.dart';
import 'package:dr_on_call/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest);
}
