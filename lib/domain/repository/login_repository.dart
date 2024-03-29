import 'package:dr_on_call/data/requests/login/login_request.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';
import '../models/login/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
}
