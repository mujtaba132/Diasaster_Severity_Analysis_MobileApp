// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ngo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardNgoModel {

 int get verifiedNGOs; int get nonVerifyNGOs; int get totalNgos;
/// Create a copy of DashboardNgoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardNgoModelCopyWith<DashboardNgoModel> get copyWith => _$DashboardNgoModelCopyWithImpl<DashboardNgoModel>(this as DashboardNgoModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardNgoModel&&(identical(other.verifiedNGOs, verifiedNGOs) || other.verifiedNGOs == verifiedNGOs)&&(identical(other.nonVerifyNGOs, nonVerifyNGOs) || other.nonVerifyNGOs == nonVerifyNGOs)&&(identical(other.totalNgos, totalNgos) || other.totalNgos == totalNgos));
}


@override
int get hashCode => Object.hash(runtimeType,verifiedNGOs,nonVerifyNGOs,totalNgos);

@override
String toString() {
  return 'DashboardNgoModel(verifiedNGOs: $verifiedNGOs, nonVerifyNGOs: $nonVerifyNGOs, totalNgos: $totalNgos)';
}


}

/// @nodoc
abstract mixin class $DashboardNgoModelCopyWith<$Res>  {
  factory $DashboardNgoModelCopyWith(DashboardNgoModel value, $Res Function(DashboardNgoModel) _then) = _$DashboardNgoModelCopyWithImpl;
@useResult
$Res call({
 int verifiedNGOs, int nonVerifyNGOs, int totalNgos
});




}
/// @nodoc
class _$DashboardNgoModelCopyWithImpl<$Res>
    implements $DashboardNgoModelCopyWith<$Res> {
  _$DashboardNgoModelCopyWithImpl(this._self, this._then);

  final DashboardNgoModel _self;
  final $Res Function(DashboardNgoModel) _then;

/// Create a copy of DashboardNgoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verifiedNGOs = null,Object? nonVerifyNGOs = null,Object? totalNgos = null,}) {
  return _then(_self.copyWith(
verifiedNGOs: null == verifiedNGOs ? _self.verifiedNGOs : verifiedNGOs // ignore: cast_nullable_to_non_nullable
as int,nonVerifyNGOs: null == nonVerifyNGOs ? _self.nonVerifyNGOs : nonVerifyNGOs // ignore: cast_nullable_to_non_nullable
as int,totalNgos: null == totalNgos ? _self.totalNgos : totalNgos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardNgoModel].
extension DashboardNgoModelPatterns on DashboardNgoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardNgoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardNgoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardNgoModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardNgoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardNgoModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardNgoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int verifiedNGOs,  int nonVerifyNGOs,  int totalNgos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardNgoModel() when $default != null:
return $default(_that.verifiedNGOs,_that.nonVerifyNGOs,_that.totalNgos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int verifiedNGOs,  int nonVerifyNGOs,  int totalNgos)  $default,) {final _that = this;
switch (_that) {
case _DashboardNgoModel():
return $default(_that.verifiedNGOs,_that.nonVerifyNGOs,_that.totalNgos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int verifiedNGOs,  int nonVerifyNGOs,  int totalNgos)?  $default,) {final _that = this;
switch (_that) {
case _DashboardNgoModel() when $default != null:
return $default(_that.verifiedNGOs,_that.nonVerifyNGOs,_that.totalNgos);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardNgoModel implements DashboardNgoModel {
  const _DashboardNgoModel({this.verifiedNGOs = 0, this.nonVerifyNGOs = 0, this.totalNgos = 0});
  

@override@JsonKey() final  int verifiedNGOs;
@override@JsonKey() final  int nonVerifyNGOs;
@override@JsonKey() final  int totalNgos;

/// Create a copy of DashboardNgoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardNgoModelCopyWith<_DashboardNgoModel> get copyWith => __$DashboardNgoModelCopyWithImpl<_DashboardNgoModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardNgoModel&&(identical(other.verifiedNGOs, verifiedNGOs) || other.verifiedNGOs == verifiedNGOs)&&(identical(other.nonVerifyNGOs, nonVerifyNGOs) || other.nonVerifyNGOs == nonVerifyNGOs)&&(identical(other.totalNgos, totalNgos) || other.totalNgos == totalNgos));
}


@override
int get hashCode => Object.hash(runtimeType,verifiedNGOs,nonVerifyNGOs,totalNgos);

@override
String toString() {
  return 'DashboardNgoModel(verifiedNGOs: $verifiedNGOs, nonVerifyNGOs: $nonVerifyNGOs, totalNgos: $totalNgos)';
}


}

/// @nodoc
abstract mixin class _$DashboardNgoModelCopyWith<$Res> implements $DashboardNgoModelCopyWith<$Res> {
  factory _$DashboardNgoModelCopyWith(_DashboardNgoModel value, $Res Function(_DashboardNgoModel) _then) = __$DashboardNgoModelCopyWithImpl;
@override @useResult
$Res call({
 int verifiedNGOs, int nonVerifyNGOs, int totalNgos
});




}
/// @nodoc
class __$DashboardNgoModelCopyWithImpl<$Res>
    implements _$DashboardNgoModelCopyWith<$Res> {
  __$DashboardNgoModelCopyWithImpl(this._self, this._then);

  final _DashboardNgoModel _self;
  final $Res Function(_DashboardNgoModel) _then;

/// Create a copy of DashboardNgoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verifiedNGOs = null,Object? nonVerifyNGOs = null,Object? totalNgos = null,}) {
  return _then(_DashboardNgoModel(
verifiedNGOs: null == verifiedNGOs ? _self.verifiedNGOs : verifiedNGOs // ignore: cast_nullable_to_non_nullable
as int,nonVerifyNGOs: null == nonVerifyNGOs ? _self.nonVerifyNGOs : nonVerifyNGOs // ignore: cast_nullable_to_non_nullable
as int,totalNgos: null == totalNgos ? _self.totalNgos : totalNgos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
