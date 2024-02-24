import 'package:Dr_OnCall/data/requests/register_request.dart';
import 'package:Dr_OnCall/data/response/login_response.dart';
import 'package:Dr_OnCall/data/response/RegisterResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
import '../requests/login_request.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @POST("users/signup")
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @POST("users/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
