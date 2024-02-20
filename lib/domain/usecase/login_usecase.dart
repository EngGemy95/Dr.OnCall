import 'package:blood_donation/data/requests/login_request.dart';
import 'package:blood_donation/domain/models/api_model.dart';
import 'package:blood_donation/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/Failure.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, ApiModel>> call(LoginRequest loginRequest) async {
    return await loginRepository.login(loginRequest);
  }
}
