// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DonationModel {

@JsonKey(name: 'ngoName') String? get ngoName;@JsonKey(name: 'bankName') String? get bankName;@JsonKey(name: 'accountNo') String? get accountNo;
/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationModelCopyWith<DonationModel> get copyWith => _$DonationModelCopyWithImpl<DonationModel>(this as DonationModel, _$identity);

  /// Serializes this DonationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationModel&&(identical(other.ngoName, ngoName) || other.ngoName == ngoName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ngoName,bankName,accountNo);

@override
String toString() {
  return 'DonationModel(ngoName: $ngoName, bankName: $bankName, accountNo: $accountNo)';
}


}

/// @nodoc
abstract mixin class $DonationModelCopyWith<$Res>  {
  factory $DonationModelCopyWith(DonationModel value, $Res Function(DonationModel) _then) = _$DonationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ngoName') String? ngoName,@JsonKey(name: 'bankName') String? bankName,@JsonKey(name: 'accountNo') String? accountNo
});




}
/// @nodoc
class _$DonationModelCopyWithImpl<$Res>
    implements $DonationModelCopyWith<$Res> {
  _$DonationModelCopyWithImpl(this._self, this._then);

  final DonationModel _self;
  final $Res Function(DonationModel) _then;

/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ngoName = freezed,Object? bankName = freezed,Object? accountNo = freezed,}) {
  return _then(_self.copyWith(
ngoName: freezed == ngoName ? _self.ngoName : ngoName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DonationModel].
extension DonationModelPatterns on DonationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DonationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DonationModel value)  $default,){
final _that = this;
switch (_that) {
case _DonationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DonationModel value)?  $default,){
final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
return $default(_that.ngoName,_that.bankName,_that.accountNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo)  $default,) {final _that = this;
switch (_that) {
case _DonationModel():
return $default(_that.ngoName,_that.bankName,_that.accountNo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo)?  $default,) {final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
return $default(_that.ngoName,_that.bankName,_that.accountNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DonationModel implements DonationModel {
  const _DonationModel({@JsonKey(name: 'ngoName') this.ngoName = '', @JsonKey(name: 'bankName') this.bankName = '', @JsonKey(name: 'accountNo') this.accountNo = ''});
  factory _DonationModel.fromJson(Map<String, dynamic> json) => _$DonationModelFromJson(json);

@override@JsonKey(name: 'ngoName') final  String? ngoName;
@override@JsonKey(name: 'bankName') final  String? bankName;
@override@JsonKey(name: 'accountNo') final  String? accountNo;

/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationModelCopyWith<_DonationModel> get copyWith => __$DonationModelCopyWithImpl<_DonationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DonationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DonationModel&&(identical(other.ngoName, ngoName) || other.ngoName == ngoName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ngoName,bankName,accountNo);

@override
String toString() {
  return 'DonationModel(ngoName: $ngoName, bankName: $bankName, accountNo: $accountNo)';
}


}

/// @nodoc
abstract mixin class _$DonationModelCopyWith<$Res> implements $DonationModelCopyWith<$Res> {
  factory _$DonationModelCopyWith(_DonationModel value, $Res Function(_DonationModel) _then) = __$DonationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ngoName') String? ngoName,@JsonKey(name: 'bankName') String? bankName,@JsonKey(name: 'accountNo') String? accountNo
});




}
/// @nodoc
class __$DonationModelCopyWithImpl<$Res>
    implements _$DonationModelCopyWith<$Res> {
  __$DonationModelCopyWithImpl(this._self, this._then);

  final _DonationModel _self;
  final $Res Function(_DonationModel) _then;

/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ngoName = freezed,Object? bankName = freezed,Object? accountNo = freezed,}) {
  return _then(_DonationModel(
ngoName: freezed == ngoName ? _self.ngoName : ngoName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
