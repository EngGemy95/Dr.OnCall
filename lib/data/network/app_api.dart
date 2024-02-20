import 'package:blood_donation/data/requests/register_request.dart';
import 'package:blood_donation/data/response/RegisterResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
import '../requests/login_request.dart';
import '../response/ApiResponse.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @GET("users/signup")
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @GET("users/login")
  Future<ApiResponse> login(@Body() LoginRequest loginRequest);
}
