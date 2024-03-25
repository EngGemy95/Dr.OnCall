
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';
import '../../data/requests/login/login_request.dart';
import '../models/change_password_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, ChangePasswordModel>> login(LoginRequest loginRequest);
}
