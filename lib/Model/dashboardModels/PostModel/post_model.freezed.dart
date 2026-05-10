// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardPostModel {

 int get verifiedPosts; int get nonVerifyPosts; int get totalPosts;
/// Create a copy of DashboardPostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardPostModelCopyWith<DashboardPostModel> get copyWith => _$DashboardPostModelCopyWithImpl<DashboardPostModel>(this as DashboardPostModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostModel&&(identical(other.verifiedPosts, verifiedPosts) || other.verifiedPosts == verifiedPosts)&&(identical(other.nonVerifyPosts, nonVerifyPosts) || other.nonVerifyPosts == nonVerifyPosts)&&(identical(other.totalPosts, totalPosts) || other.totalPosts == totalPosts));
}


@override
int get hashCode => Object.hash(runtimeType,verifiedPosts,nonVerifyPosts,totalPosts);

@override
String toString() {
  return 'DashboardPostModel(verifiedPosts: $verifiedPosts, nonVerifyPosts: $nonVerifyPosts, totalPosts: $totalPosts)';
}


}

/// @nodoc
abstract mixin class $DashboardPostModelCopyWith<$Res>  {
  factory $DashboardPostModelCopyWith(DashboardPostModel value, $Res Function(DashboardPostModel) _then) = _$DashboardPostModelCopyWithImpl;
@useResult
$Res call({
 int verifiedPosts, int nonVerifyPosts, int totalPosts
});




}
/// @nodoc
class _$DashboardPostModelCopyWithImpl<$Res>
    implements $DashboardPostModelCopyWith<$Res> {
  _$DashboardPostModelCopyWithImpl(this._self, this._then);

  final DashboardPostModel _self;
  final $Res Function(DashboardPostModel) _then;

/// Create a copy of DashboardPostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verifiedPosts = null,Object? nonVerifyPosts = null,Object? totalPosts = null,}) {
  return _then(_self.copyWith(
verifiedPosts: null == verifiedPosts ? _self.verifiedPosts : verifiedPosts // ignore: cast_nullable_to_non_nullable
as int,nonVerifyPosts: null == nonVerifyPosts ? _self.nonVerifyPosts : nonVerifyPosts // ignore: cast_nullable_to_non_nullable
as int,totalPosts: null == totalPosts ? _self.totalPosts : totalPosts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardPostModel].
extension DashboardPostModelPatterns on DashboardPostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardPostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardPostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardPostModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardPostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardPostModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardPostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int verifiedPosts,  int nonVerifyPosts,  int totalPosts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardPostModel() when $default != null:
return $default(_that.verifiedPosts,_that.nonVerifyPosts,_that.totalPosts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int verifiedPosts,  int nonVerifyPosts,  int totalPosts)  $default,) {final _that = this;
switch (_that) {
case _DashboardPostModel():
return $default(_that.verifiedPosts,_that.nonVerifyPosts,_that.totalPosts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int verifiedPosts,  int nonVerifyPosts,  int totalPosts)?  $default,) {final _that = this;
switch (_that) {
case _DashboardPostModel() when $default != null:
return $default(_that.verifiedPosts,_that.nonVerifyPosts,_that.totalPosts);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardPostModel implements DashboardPostModel {
  const _DashboardPostModel({this.verifiedPosts = 0, this.nonVerifyPosts = 0, this.totalPosts = 0});
  

@override@JsonKey() final  int verifiedPosts;
@override@JsonKey() final  int nonVerifyPosts;
@override@JsonKey() final  int totalPosts;

/// Create a copy of DashboardPostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardPostModelCopyWith<_DashboardPostModel> get copyWith => __$DashboardPostModelCopyWithImpl<_DashboardPostModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardPostModel&&(identical(other.verifiedPosts, verifiedPosts) || other.verifiedPosts == verifiedPosts)&&(identical(other.nonVerifyPosts, nonVerifyPosts) || other.nonVerifyPosts == nonVerifyPosts)&&(identical(other.totalPosts, totalPosts) || other.totalPosts == totalPosts));
}


@override
int get hashCode => Object.hash(runtimeType,verifiedPosts,nonVerifyPosts,totalPosts);

@override
String toString() {
  return 'DashboardPostModel(verifiedPosts: $verifiedPosts, nonVerifyPosts: $nonVerifyPosts, totalPosts: $totalPosts)';
}


}

/// @nodoc
abstract mixin class _$DashboardPostModelCopyWith<$Res> implements $DashboardPostModelCopyWith<$Res> {
  factory _$DashboardPostModelCopyWith(_DashboardPostModel value, $Res Function(_DashboardPostModel) _then) = __$DashboardPostModelCopyWithImpl;
@override @useResult
$Res call({
 int verifiedPosts, int nonVerifyPosts, int totalPosts
});




}
/// @nodoc
class __$DashboardPostModelCopyWithImpl<$Res>
    implements _$DashboardPostModelCopyWith<$Res> {
  __$DashboardPostModelCopyWithImpl(this._self, this._then);

  final _DashboardPostModel _self;
  final $Res Function(_DashboardPostModel) _then;

/// Create a copy of DashboardPostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verifiedPosts = null,Object? nonVerifyPosts = null,Object? totalPosts = null,}) {
  return _then(_DashboardPostModel(
verifiedPosts: null == verifiedPosts ? _self.verifiedPosts : verifiedPosts // ignore: cast_nullable_to_non_nullable
as int,nonVerifyPosts: null == nonVerifyPosts ? _self.nonVerifyPosts : nonVerifyPosts // ignore: cast_nullable_to_non_nullable
as int,totalPosts: null == totalPosts ? _self.totalPosts : totalPosts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
