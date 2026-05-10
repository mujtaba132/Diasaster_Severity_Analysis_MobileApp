// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardUserModel {

 int get totalAdmins; int get totalNormalUsers; int get totalUsers;
/// Create a copy of DashboardUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardUserModelCopyWith<DashboardUserModel> get copyWith => _$DashboardUserModelCopyWithImpl<DashboardUserModel>(this as DashboardUserModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardUserModel&&(identical(other.totalAdmins, totalAdmins) || other.totalAdmins == totalAdmins)&&(identical(other.totalNormalUsers, totalNormalUsers) || other.totalNormalUsers == totalNormalUsers)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers));
}


@override
int get hashCode => Object.hash(runtimeType,totalAdmins,totalNormalUsers,totalUsers);

@override
String toString() {
  return 'DashboardUserModel(totalAdmins: $totalAdmins, totalNormalUsers: $totalNormalUsers, totalUsers: $totalUsers)';
}


}

/// @nodoc
abstract mixin class $DashboardUserModelCopyWith<$Res>  {
  factory $DashboardUserModelCopyWith(DashboardUserModel value, $Res Function(DashboardUserModel) _then) = _$DashboardUserModelCopyWithImpl;
@useResult
$Res call({
 int totalAdmins, int totalNormalUsers, int totalUsers
});




}
/// @nodoc
class _$DashboardUserModelCopyWithImpl<$Res>
    implements $DashboardUserModelCopyWith<$Res> {
  _$DashboardUserModelCopyWithImpl(this._self, this._then);

  final DashboardUserModel _self;
  final $Res Function(DashboardUserModel) _then;

/// Create a copy of DashboardUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAdmins = null,Object? totalNormalUsers = null,Object? totalUsers = null,}) {
  return _then(_self.copyWith(
totalAdmins: null == totalAdmins ? _self.totalAdmins : totalAdmins // ignore: cast_nullable_to_non_nullable
as int,totalNormalUsers: null == totalNormalUsers ? _self.totalNormalUsers : totalNormalUsers // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardUserModel].
extension DashboardUserModelPatterns on DashboardUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardUserModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalAdmins,  int totalNormalUsers,  int totalUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardUserModel() when $default != null:
return $default(_that.totalAdmins,_that.totalNormalUsers,_that.totalUsers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalAdmins,  int totalNormalUsers,  int totalUsers)  $default,) {final _that = this;
switch (_that) {
case _DashboardUserModel():
return $default(_that.totalAdmins,_that.totalNormalUsers,_that.totalUsers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalAdmins,  int totalNormalUsers,  int totalUsers)?  $default,) {final _that = this;
switch (_that) {
case _DashboardUserModel() when $default != null:
return $default(_that.totalAdmins,_that.totalNormalUsers,_that.totalUsers);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardUserModel implements DashboardUserModel {
  const _DashboardUserModel({this.totalAdmins = 0, this.totalNormalUsers = 0, this.totalUsers = 0});
  

@override@JsonKey() final  int totalAdmins;
@override@JsonKey() final  int totalNormalUsers;
@override@JsonKey() final  int totalUsers;

/// Create a copy of DashboardUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardUserModelCopyWith<_DashboardUserModel> get copyWith => __$DashboardUserModelCopyWithImpl<_DashboardUserModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardUserModel&&(identical(other.totalAdmins, totalAdmins) || other.totalAdmins == totalAdmins)&&(identical(other.totalNormalUsers, totalNormalUsers) || other.totalNormalUsers == totalNormalUsers)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers));
}


@override
int get hashCode => Object.hash(runtimeType,totalAdmins,totalNormalUsers,totalUsers);

@override
String toString() {
  return 'DashboardUserModel(totalAdmins: $totalAdmins, totalNormalUsers: $totalNormalUsers, totalUsers: $totalUsers)';
}


}

/// @nodoc
abstract mixin class _$DashboardUserModelCopyWith<$Res> implements $DashboardUserModelCopyWith<$Res> {
  factory _$DashboardUserModelCopyWith(_DashboardUserModel value, $Res Function(_DashboardUserModel) _then) = __$DashboardUserModelCopyWithImpl;
@override @useResult
$Res call({
 int totalAdmins, int totalNormalUsers, int totalUsers
});




}
/// @nodoc
class __$DashboardUserModelCopyWithImpl<$Res>
    implements _$DashboardUserModelCopyWith<$Res> {
  __$DashboardUserModelCopyWithImpl(this._self, this._then);

  final _DashboardUserModel _self;
  final $Res Function(_DashboardUserModel) _then;

/// Create a copy of DashboardUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAdmins = null,Object? totalNormalUsers = null,Object? totalUsers = null,}) {
  return _then(_DashboardUserModel(
totalAdmins: null == totalAdmins ? _self.totalAdmins : totalAdmins // ignore: cast_nullable_to_non_nullable
as int,totalNormalUsers: null == totalNormalUsers ? _self.totalNormalUsers : totalNormalUsers // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
