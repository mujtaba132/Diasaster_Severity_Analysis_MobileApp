// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaModel {

@JsonKey(name: 'location') String? get location;@JsonKey(name: 'report_id') String? get reportId;@JsonKey(name: 'disaster_type') String? get disasterType;@JsonKey(name: 'severity') double? get severity;@JsonKey(name: 'media_url') String? get mediaUrl;@JsonKey(name: 'status') String? get status;
/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaModelCopyWith<MediaModel> get copyWith => _$MediaModelCopyWithImpl<MediaModel>(this as MediaModel, _$identity);

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaModel&&(identical(other.location, location) || other.location == location)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.disasterType, disasterType) || other.disasterType == disasterType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,reportId,disasterType,severity,mediaUrl,status);

@override
String toString() {
  return 'MediaModel(location: $location, reportId: $reportId, disasterType: $disasterType, severity: $severity, mediaUrl: $mediaUrl, status: $status)';
}


}

/// @nodoc
abstract mixin class $MediaModelCopyWith<$Res>  {
  factory $MediaModelCopyWith(MediaModel value, $Res Function(MediaModel) _then) = _$MediaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'location') String? location,@JsonKey(name: 'report_id') String? reportId,@JsonKey(name: 'disaster_type') String? disasterType,@JsonKey(name: 'severity') double? severity,@JsonKey(name: 'media_url') String? mediaUrl,@JsonKey(name: 'status') String? status
});




}
/// @nodoc
class _$MediaModelCopyWithImpl<$Res>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._self, this._then);

  final MediaModel _self;
  final $Res Function(MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = freezed,Object? reportId = freezed,Object? disasterType = freezed,Object? severity = freezed,Object? mediaUrl = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,reportId: freezed == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String?,disasterType: freezed == disasterType ? _self.disasterType : disasterType // ignore: cast_nullable_to_non_nullable
as String?,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as double?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaModel].
extension MediaModelPatterns on MediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'location')  String? location, @JsonKey(name: 'report_id')  String? reportId, @JsonKey(name: 'disaster_type')  String? disasterType, @JsonKey(name: 'severity')  double? severity, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'status')  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.location,_that.reportId,_that.disasterType,_that.severity,_that.mediaUrl,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'location')  String? location, @JsonKey(name: 'report_id')  String? reportId, @JsonKey(name: 'disaster_type')  String? disasterType, @JsonKey(name: 'severity')  double? severity, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'status')  String? status)  $default,) {final _that = this;
switch (_that) {
case _MediaModel():
return $default(_that.location,_that.reportId,_that.disasterType,_that.severity,_that.mediaUrl,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'location')  String? location, @JsonKey(name: 'report_id')  String? reportId, @JsonKey(name: 'disaster_type')  String? disasterType, @JsonKey(name: 'severity')  double? severity, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'status')  String? status)?  $default,) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.location,_that.reportId,_that.disasterType,_that.severity,_that.mediaUrl,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaModel implements MediaModel {
  const _MediaModel({@JsonKey(name: 'location') this.location = '', @JsonKey(name: 'report_id') this.reportId = '', @JsonKey(name: 'disaster_type') this.disasterType = '', @JsonKey(name: 'severity') this.severity = 0.0, @JsonKey(name: 'media_url') this.mediaUrl = '', @JsonKey(name: 'status') this.status = 'pending'});
  factory _MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);

@override@JsonKey(name: 'location') final  String? location;
@override@JsonKey(name: 'report_id') final  String? reportId;
@override@JsonKey(name: 'disaster_type') final  String? disasterType;
@override@JsonKey(name: 'severity') final  double? severity;
@override@JsonKey(name: 'media_url') final  String? mediaUrl;
@override@JsonKey(name: 'status') final  String? status;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaModelCopyWith<_MediaModel> get copyWith => __$MediaModelCopyWithImpl<_MediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaModel&&(identical(other.location, location) || other.location == location)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.disasterType, disasterType) || other.disasterType == disasterType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,reportId,disasterType,severity,mediaUrl,status);

@override
String toString() {
  return 'MediaModel(location: $location, reportId: $reportId, disasterType: $disasterType, severity: $severity, mediaUrl: $mediaUrl, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MediaModelCopyWith<$Res> implements $MediaModelCopyWith<$Res> {
  factory _$MediaModelCopyWith(_MediaModel value, $Res Function(_MediaModel) _then) = __$MediaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'location') String? location,@JsonKey(name: 'report_id') String? reportId,@JsonKey(name: 'disaster_type') String? disasterType,@JsonKey(name: 'severity') double? severity,@JsonKey(name: 'media_url') String? mediaUrl,@JsonKey(name: 'status') String? status
});




}
/// @nodoc
class __$MediaModelCopyWithImpl<$Res>
    implements _$MediaModelCopyWith<$Res> {
  __$MediaModelCopyWithImpl(this._self, this._then);

  final _MediaModel _self;
  final $Res Function(_MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = freezed,Object? reportId = freezed,Object? disasterType = freezed,Object? severity = freezed,Object? mediaUrl = freezed,Object? status = freezed,}) {
  return _then(_MediaModel(
location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,reportId: freezed == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String?,disasterType: freezed == disasterType ? _self.disasterType : disasterType // ignore: cast_nullable_to_non_nullable
as String?,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as double?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
