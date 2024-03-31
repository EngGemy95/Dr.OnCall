import 'dart:io';

import 'package:dr_on_call/data/requests/register_request.dart';
import 'package:dr_on_call/data/response/login/login_response.dart';
import 'package:dr_on_call/data/response/register_response/RegisterResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/constants.dart';
import '../requests/login/login_request.dart';
import '../requests/update_password/update_password_request.dart';
import '../response/profile/update_profile_response.dart';
import '../response/update_password/update_password_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @POST("users/signup")
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @POST("users/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("users/updateProfile")
  @MultiPart()
  Future<UpdateProfileResponse> updateProfile(
    @Part(name: "name") String name,
    @Part(name: "gender") String gender, {
    @Part(name: "phone") String? phone,
    @Part(name: "bloodType") String? bloodType,
    @Part() File? image,
    @SendProgress() ProgressCallback? onSendProgress,
  });

  @PATCH("users/changePassword")
  Future<UpdatePasswordResponse> updatePassword(
      @Body() UpdatePasswordRequest changePasswordRequest);
}
