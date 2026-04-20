// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentModel {

@JsonKey(name: 'comment_id') String? get commentId;@JsonKey(name: 'user_name') String? get userName;@JsonKey(name: 'user_profile_url') String? get userProfileUrl;@JsonKey(name: 'comment') String? get comment;@JsonKey(name: 'is_like') bool? get isLike;@JsonKey(name: 'likes') int? get likes;@JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? get timeStamp;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userProfileUrl, userProfileUrl) || other.userProfileUrl == userProfileUrl)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isLike, isLike) || other.isLike == isLike)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commentId,userName,userProfileUrl,comment,isLike,likes,timeStamp);

@override
String toString() {
  return 'CommentModel(commentId: $commentId, userName: $userName, userProfileUrl: $userProfileUrl, comment: $comment, isLike: $isLike, likes: $likes, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'comment_id') String? commentId,@JsonKey(name: 'user_name') String? userName,@JsonKey(name: 'user_profile_url') String? userProfileUrl,@JsonKey(name: 'comment') String? comment,@JsonKey(name: 'is_like') bool? isLike,@JsonKey(name: 'likes') int? likes,@JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? timeStamp
});




}
/// @nodoc
class _$CommentModelCopyWithImpl<$Res>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentId = freezed,Object? userName = freezed,Object? userProfileUrl = freezed,Object? comment = freezed,Object? isLike = freezed,Object? likes = freezed,Object? timeStamp = freezed,}) {
  return _then(_self.copyWith(
commentId: freezed == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userProfileUrl: freezed == userProfileUrl ? _self.userProfileUrl : userProfileUrl // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,isLike: freezed == isLike ? _self.isLike : isLike // ignore: cast_nullable_to_non_nullable
as bool?,likes: freezed == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int?,timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentModel].
extension CommentModelPatterns on CommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'comment_id')  String? commentId, @JsonKey(name: 'user_name')  String? userName, @JsonKey(name: 'user_profile_url')  String? userProfileUrl, @JsonKey(name: 'comment')  String? comment, @JsonKey(name: 'is_like')  bool? isLike, @JsonKey(name: 'likes')  int? likes, @JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime? timeStamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.commentId,_that.userName,_that.userProfileUrl,_that.comment,_that.isLike,_that.likes,_that.timeStamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'comment_id')  String? commentId, @JsonKey(name: 'user_name')  String? userName, @JsonKey(name: 'user_profile_url')  String? userProfileUrl, @JsonKey(name: 'comment')  String? comment, @JsonKey(name: 'is_like')  bool? isLike, @JsonKey(name: 'likes')  int? likes, @JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime? timeStamp)  $default,) {final _that = this;
switch (_that) {
case _CommentModel():
return $default(_that.commentId,_that.userName,_that.userProfileUrl,_that.comment,_that.isLike,_that.likes,_that.timeStamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'comment_id')  String? commentId, @JsonKey(name: 'user_name')  String? userName, @JsonKey(name: 'user_profile_url')  String? userProfileUrl, @JsonKey(name: 'comment')  String? comment, @JsonKey(name: 'is_like')  bool? isLike, @JsonKey(name: 'likes')  int? likes, @JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime? timeStamp)?  $default,) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.commentId,_that.userName,_that.userProfileUrl,_that.comment,_that.isLike,_that.likes,_that.timeStamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentModel implements CommentModel {
  const _CommentModel({@JsonKey(name: 'comment_id') this.commentId = '', @JsonKey(name: 'user_name') this.userName = '', @JsonKey(name: 'user_profile_url') this.userProfileUrl = '', @JsonKey(name: 'comment') this.comment = '', @JsonKey(name: 'is_like') this.isLike = false, @JsonKey(name: 'likes') this.likes = 0, @JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson) this.timeStamp});
  factory _CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

@override@JsonKey(name: 'comment_id') final  String? commentId;
@override@JsonKey(name: 'user_name') final  String? userName;
@override@JsonKey(name: 'user_profile_url') final  String? userProfileUrl;
@override@JsonKey(name: 'comment') final  String? comment;
@override@JsonKey(name: 'is_like') final  bool? isLike;
@override@JsonKey(name: 'likes') final  int? likes;
@override@JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime? timeStamp;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentModelCopyWith<_CommentModel> get copyWith => __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userProfileUrl, userProfileUrl) || other.userProfileUrl == userProfileUrl)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isLike, isLike) || other.isLike == isLike)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commentId,userName,userProfileUrl,comment,isLike,likes,timeStamp);

@override
String toString() {
  return 'CommentModel(commentId: $commentId, userName: $userName, userProfileUrl: $userProfileUrl, comment: $comment, isLike: $isLike, likes: $likes, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'comment_id') String? commentId,@JsonKey(name: 'user_name') String? userName,@JsonKey(name: 'user_profile_url') String? userProfileUrl,@JsonKey(name: 'comment') String? comment,@JsonKey(name: 'is_like') bool? isLike,@JsonKey(name: 'likes') int? likes,@JsonKey(name: 'time_stamp', fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? timeStamp
});




}
/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentId = freezed,Object? userName = freezed,Object? userProfileUrl = freezed,Object? comment = freezed,Object? isLike = freezed,Object? likes = freezed,Object? timeStamp = freezed,}) {
  return _then(_CommentModel(
commentId: freezed == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userProfileUrl: freezed == userProfileUrl ? _self.userProfileUrl : userProfileUrl // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,isLike: freezed == isLike ? _self.isLike : isLike // ignore: cast_nullable_to_non_nullable
as bool?,likes: freezed == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int?,timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
