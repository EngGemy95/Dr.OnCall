import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/requests/update_password/update_password_request.dart';
import 'package:dr_on_call/domain/models/change_password/change_password_model.dart';

import '../../data/network/Failure.dart';
import '../repository/update_password_repository.dart';

class UpdatePasswordUseCase {
  final UpdatePasswordRepository updatePasswordRepository;

  UpdatePasswordUseCase(this.updatePasswordRepository);

  Future<Either<Failure, UpdatePasswordModel>> call(
      UpdatePasswordRequest updatePasswordRequest) async {
    return await updatePasswordRepository.updatePassword(updatePasswordRequest);
  }
}
