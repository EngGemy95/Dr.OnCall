import 'package:blood_donation/data/requests/login_request.dart';
import 'package:blood_donation/data/requests/register_request.dart';
import 'package:blood_donation/domain/models/api_model.dart';
import 'package:blood_donation/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest);

}
