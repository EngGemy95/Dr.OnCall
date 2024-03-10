import 'package:Dr/data/response/login_response.dart';
import 'package:Dr/data/response/RegisterResponse.dart';
import 'package:Dr/domain/models/login/login_model.dart';
import 'package:Dr/domain/models/register_model.dart';
import '../../app/constants.dart';
import '../../app/extensions.dart';

extension RegisterMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(
      code: this?.status.orZero() ?? Constants.zero,
      message: this?.message.orEmpty() ?? Constants.empty,
      data: this?.data != null ? this!.data : null,
    );
  }
}

extension LoginMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      status: this?.status.orZero() ?? Constants.zero,
      message: this?.message.orEmpty() ?? Constants.empty,
      data: this?.data != null ? this!.data.toDomain() : null,
    );
  }
}

extension UserMapper on UserResponse? {
  User toDomain() {
    return User(
      name: this?.name.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
      type: this?.type.orEmpty() ?? Constants.empty,
    );
  }
}

extension LoginDataMapper on LoginDataResponse? {
  LoginData toDomain() {
    return LoginData(
      user: this?.user != null ? this!.user.toDomain() : null,
      token: this?.token != null ? this!.token : null,
    );
  }
}
