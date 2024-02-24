import 'package:Dr_OnCall/data/requests/login_request.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';
import '../models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
}
