import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dr_on_call/data/network/Failure.dart';

import '../models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> updateProfile({
    required String name,
    required String gender,
    String? bloodType,
    String? phone,
    File? image,
  });
}
