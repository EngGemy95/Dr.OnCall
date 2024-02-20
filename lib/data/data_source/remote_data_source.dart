import 'package:blood_donation/data/requests/register_request.dart';
import 'package:blood_donation/data/response/RegisterResponse.dart';

import '../network/app_api.dart';
import '../requests/login_request.dart';
import '../response/ApiResponse.dart';

abstract class RemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<ApiResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(registerRequest);
  }

  @override
  Future<ApiResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest);
  }
}
