import 'package:blood_donation/data/response/ApiResponse.dart';
import 'package:blood_donation/data/response/RegisterResponse.dart';
import 'package:blood_donation/domain/models/register_model.dart';
import '../../app/constants.dart';
import '../../app/extensions.dart';
import '../../domain/models/api_model.dart';

extension RegisterMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(
      code: this?.code.orZero() ?? Constants.zero,
      message: this?.message.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
    );
  }
}

extension ApiMapper on ApiResponse? {
  ApiModel toDomain() {
    return ApiModel(
      code: this?.code.orZero() ?? Constants.zero,
      message: this?.message.orEmpty() ?? Constants.empty,
      token: this?.token.orEmpty() ?? Constants.empty,
      data: this?.token.orEmpty() ?? Constants.empty,
    );
  }
}
