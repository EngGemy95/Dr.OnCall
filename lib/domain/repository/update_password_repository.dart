import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/requests/update_password/update_password_request.dart';

import '../../data/network/Failure.dart';
import '../models/change_password/change_password_model.dart';

abstract class UpdatePasswordRepository {
  Future<Either<Failure, UpdatePasswordModel>> updatePassword(
      UpdatePasswordRequest updatePasswordRequest);
}
