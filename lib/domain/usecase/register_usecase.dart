import 'package:Dr/data/requests/register_request.dart';
import 'package:Dr/domain/models/register_model.dart';
import 'package:Dr/domain/repository/register_repository.dart';
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
