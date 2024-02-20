import 'package:blood_donation/data/requests/register_request.dart';
import 'package:blood_donation/domain/models/register_model.dart';
import 'package:blood_donation/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/Failure.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository;

  RegisterUseCase(this.registerRepository);

  Future<Either<Failure, RegisterModel>> call(
      RegisterRequest registerRequest) async {
    return await registerRepository.register(registerRequest);
  }
}
