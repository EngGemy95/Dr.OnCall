import 'dart:io';

import 'package:dr_on_call/data/requests/change_password/change_password_request.dart';
import 'package:dr_on_call/data/requests/register_request.dart';
import 'package:dr_on_call/data/response/register_response/RegisterResponse.dart';
import 'package:dr_on_call/data/response/profile/update_profile_response.dart';
import '../network/app_api.dart';
import '../requests/login/login_request.dart';
import '../response/login/login_response.dart';

abstract class RemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<UpdateProfileResponse> updateProfile({
    required String name,
    required String gender,
    String? bloodType,
    String? phone,
    File? image,
  });
  Future<LoginResponse> updatePassword(
      ChangePasswordRequest changePasswordRequest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(registerRequest);
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest);
  }

  @override
  Future<UpdateProfileResponse> updateProfile({
    required String name,
    required String gender,
    String? bloodType,
    String? phone,
    File? image,
  }) async {
    return await _appServiceClient.updateProfile(
      name,
      gender,
      bloodType: bloodType,
      phone: phone,
      image: image,
    );
  }

  @override
  Future<LoginResponse> updatePassword(
      ChangePasswordRequest changePasswordRequest) async {
    return await _appServiceClient.changePassword(changePasswordRequest);
  }
}
