// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetMoviesObject {
  int get page => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isHasMoreMovies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetMoviesObjectCopyWith<GetMoviesObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMoviesObjectCopyWith<$Res> {
  factory $GetMoviesObjectCopyWith(
          GetMoviesObject value, $Res Function(GetMoviesObject) then) =
      _$GetMoviesObjectCopyWithImpl<$Res, GetMoviesObject>;
  @useResult
  $Res call({int page, String type, bool isHasMoreMovies});
}

/// @nodoc
class _$GetMoviesObjectCopyWithImpl<$Res, $Val extends GetMoviesObject>
    implements $GetMoviesObjectCopyWith<$Res> {
  _$GetMoviesObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? type = null,
    Object? isHasMoreMovies = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isHasMoreMovies: null == isHasMoreMovies
          ? _value.isHasMoreMovies
          : isHasMoreMovies // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMoviesObjectImplCopyWith<$Res>
    implements $GetMoviesObjectCopyWith<$Res> {
  factory _$$GetMoviesObjectImplCopyWith(_$GetMoviesObjectImpl value,
          $Res Function(_$GetMoviesObjectImpl) then) =
      __$$GetMoviesObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, String type, bool isHasMoreMovies});
}

/// @nodoc
class __$$GetMoviesObjectImplCopyWithImpl<$Res>
    extends _$GetMoviesObjectCopyWithImpl<$Res, _$GetMoviesObjectImpl>
    implements _$$GetMoviesObjectImplCopyWith<$Res> {
  __$$GetMoviesObjectImplCopyWithImpl(
      _$GetMoviesObjectImpl _value, $Res Function(_$GetMoviesObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? type = null,
    Object? isHasMoreMovies = null,
  }) {
    return _then(_$GetMoviesObjectImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == isHasMoreMovies
          ? _value.isHasMoreMovies
          : isHasMoreMovies // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetMoviesObjectImpl implements _GetMoviesObject {
  _$GetMoviesObjectImpl(this.page, this.type, this.isHasMoreMovies);

  @override
  final int page;
  @override
  final String type;
  @override
  final bool isHasMoreMovies;

  @override
  String toString() {
    return 'GetMoviesObject(page: $page, type: $type, isHasMoreMovies: $isHasMoreMovies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoviesObjectImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isHasMoreMovies, isHasMoreMovies) ||
                other.isHasMoreMovies == isHasMoreMovies));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, type, isHasMoreMovies);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMoviesObjectImplCopyWith<_$GetMoviesObjectImpl> get copyWith =>
      __$$GetMoviesObjectImplCopyWithImpl<_$GetMoviesObjectImpl>(
          this, _$identity);
}

abstract class _GetMoviesObject implements GetMoviesObject {
  factory _GetMoviesObject(
          final int page, final String type, final bool isHasMoreMovies) =
      _$GetMoviesObjectImpl;

  @override
  int get page;
  @override
  String get type;
  @override
  bool get isHasMoreMovies;
  @override
  @JsonKey(ignore: true)
  _$$GetMoviesObjectImplCopyWith<_$GetMoviesObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
