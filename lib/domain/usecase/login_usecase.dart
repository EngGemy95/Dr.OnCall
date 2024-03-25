import 'package:dr_on_call/data/requests/login/login_request.dart';
import 'package:dr_on_call/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/Failure.dart';
import '../models/login/login_model.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, LoginModel>> call(LoginRequest loginRequest) async {
    return await loginRepository.login(loginRequest);
  }
}
