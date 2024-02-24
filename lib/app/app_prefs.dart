import 'dart:convert';

import 'package:Dr_OnCall/data/response/response.dart';
import 'package:Dr_OnCall/domain/models/models.dart';
import 'package:Dr_OnCall/presentation/resource_data/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Dr_OnCall/data/mapper/mapper.dart';

class AppPreference {
  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  Future<void> setCachedMovies(
      String type, List<ItemsResponse> itemsResponse) async {
    if (type == AppStrings.popularType) {
      await _sharedPreferences.setString(
          type,
          json.encode(itemsResponse
              .map<Map<String, dynamic>>((item) => item.toJson())
              .toList()));
    } else if (type == AppStrings.topRatedType) {
      await _sharedPreferences.setString(
          type,
          json.encode(itemsResponse
              .map<Map<String, dynamic>>((item) => item.toJson())
              .toList()));
    }
  }

  // List<ItemsModel>? getCachedMovies(String type) {
  //   if (type == AppStrings.popularType) {
  //     String? itemsResponse = _sharedPreferences.getString(type);

  //     return (json.decode(itemsResponse ?? '[]') as List<dynamic>)
  //         .map<ItemsModel>((item) => ItemsResponse.fromJson(item).toDomain())
  //         .toList();
  //   } else if (type == AppStrings.topRatedType) {
  //     String? itemsResponse = _sharedPreferences.getString(type);

  //     return (json.decode(itemsResponse ?? '[]') as List<dynamic>)
  //         .map<ItemsModel>((item) => ItemsResponse.fromJson(item).toDomain())
  //         .toList();
  //   }
  // }
}
