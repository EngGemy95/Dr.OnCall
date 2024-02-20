import 'package:blood_donation/data/requests/login_request.dart';
import 'package:blood_donation/domain/models/api_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, ApiModel>> login(LoginRequest loginRequest);
}
