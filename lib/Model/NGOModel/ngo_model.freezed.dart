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
mixin _$NGOModel {

 String? get id; bool? get isSelected;@JsonKey(name: 'userId') String? get userId;@JsonKey(name: 'ngoName') String? get ngoName;@JsonKey(name: 'address') String? get address;@JsonKey(name: 'phoneNo') String? get phoneNo;@JsonKey(name: 'bankName') String? get bankName;@JsonKey(name: 'accountNo') String? get accountNo;@JsonKey(name: 'isVerified') bool? get isVerified;@JsonKey(name: 'certificateUrl') String? get cerficateUrl;
/// Create a copy of NGOModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NGOModelCopyWith<NGOModel> get copyWith => _$NGOModelCopyWithImpl<NGOModel>(this as NGOModel, _$identity);

  /// Serializes this NGOModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NGOModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ngoName, ngoName) || other.ngoName == ngoName)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.cerficateUrl, cerficateUrl) || other.cerficateUrl == cerficateUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isSelected,userId,ngoName,address,phoneNo,bankName,accountNo,isVerified,cerficateUrl);

@override
String toString() {
  return 'NGOModel(id: $id, isSelected: $isSelected, userId: $userId, ngoName: $ngoName, address: $address, phoneNo: $phoneNo, bankName: $bankName, accountNo: $accountNo, isVerified: $isVerified, cerficateUrl: $cerficateUrl)';
}


}

/// @nodoc
abstract mixin class $NGOModelCopyWith<$Res>  {
  factory $NGOModelCopyWith(NGOModel value, $Res Function(NGOModel) _then) = _$NGOModelCopyWithImpl;
@useResult
$Res call({
 String? id, bool? isSelected,@JsonKey(name: 'userId') String? userId,@JsonKey(name: 'ngoName') String? ngoName,@JsonKey(name: 'address') String? address,@JsonKey(name: 'phoneNo') String? phoneNo,@JsonKey(name: 'bankName') String? bankName,@JsonKey(name: 'accountNo') String? accountNo,@JsonKey(name: 'isVerified') bool? isVerified,@JsonKey(name: 'certificateUrl') String? cerficateUrl
});




}
/// @nodoc
class _$NGOModelCopyWithImpl<$Res>
    implements $NGOModelCopyWith<$Res> {
  _$NGOModelCopyWithImpl(this._self, this._then);

  final NGOModel _self;
  final $Res Function(NGOModel) _then;

/// Create a copy of NGOModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? isSelected = freezed,Object? userId = freezed,Object? ngoName = freezed,Object? address = freezed,Object? phoneNo = freezed,Object? bankName = freezed,Object? accountNo = freezed,Object? isVerified = freezed,Object? cerficateUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,ngoName: freezed == ngoName ? _self.ngoName : ngoName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNo: freezed == phoneNo ? _self.phoneNo : phoneNo // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,cerficateUrl: freezed == cerficateUrl ? _self.cerficateUrl : cerficateUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NGOModel].
extension NGOModelPatterns on NGOModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NGOModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NGOModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NGOModel value)  $default,){
final _that = this;
switch (_that) {
case _NGOModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NGOModel value)?  $default,){
final _that = this;
switch (_that) {
case _NGOModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  bool? isSelected, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'phoneNo')  String? phoneNo, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo, @JsonKey(name: 'isVerified')  bool? isVerified, @JsonKey(name: 'certificateUrl')  String? cerficateUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NGOModel() when $default != null:
return $default(_that.id,_that.isSelected,_that.userId,_that.ngoName,_that.address,_that.phoneNo,_that.bankName,_that.accountNo,_that.isVerified,_that.cerficateUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  bool? isSelected, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'phoneNo')  String? phoneNo, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo, @JsonKey(name: 'isVerified')  bool? isVerified, @JsonKey(name: 'certificateUrl')  String? cerficateUrl)  $default,) {final _that = this;
switch (_that) {
case _NGOModel():
return $default(_that.id,_that.isSelected,_that.userId,_that.ngoName,_that.address,_that.phoneNo,_that.bankName,_that.accountNo,_that.isVerified,_that.cerficateUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  bool? isSelected, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'phoneNo')  String? phoneNo, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo, @JsonKey(name: 'isVerified')  bool? isVerified, @JsonKey(name: 'certificateUrl')  String? cerficateUrl)?  $default,) {final _that = this;
switch (_that) {
case _NGOModel() when $default != null:
return $default(_that.id,_that.isSelected,_that.userId,_that.ngoName,_that.address,_that.phoneNo,_that.bankName,_that.accountNo,_that.isVerified,_that.cerficateUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NGOModel implements NGOModel {
  const _NGOModel({this.id = '', this.isSelected = false, @JsonKey(name: 'userId') this.userId = '', @JsonKey(name: 'ngoName') this.ngoName = '', @JsonKey(name: 'address') this.address = '', @JsonKey(name: 'phoneNo') this.phoneNo = '', @JsonKey(name: 'bankName') this.bankName = '', @JsonKey(name: 'accountNo') this.accountNo = '', @JsonKey(name: 'isVerified') this.isVerified = false, @JsonKey(name: 'certificateUrl') this.cerficateUrl = ''});
  factory _NGOModel.fromJson(Map<String, dynamic> json) => _$NGOModelFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey() final  bool? isSelected;
@override@JsonKey(name: 'userId') final  String? userId;
@override@JsonKey(name: 'ngoName') final  String? ngoName;
@override@JsonKey(name: 'address') final  String? address;
@override@JsonKey(name: 'phoneNo') final  String? phoneNo;
@override@JsonKey(name: 'bankName') final  String? bankName;
@override@JsonKey(name: 'accountNo') final  String? accountNo;
@override@JsonKey(name: 'isVerified') final  bool? isVerified;
@override@JsonKey(name: 'certificateUrl') final  String? cerficateUrl;

/// Create a copy of NGOModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NGOModelCopyWith<_NGOModel> get copyWith => __$NGOModelCopyWithImpl<_NGOModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NGOModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NGOModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ngoName, ngoName) || other.ngoName == ngoName)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.cerficateUrl, cerficateUrl) || other.cerficateUrl == cerficateUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isSelected,userId,ngoName,address,phoneNo,bankName,accountNo,isVerified,cerficateUrl);

@override
String toString() {
  return 'NGOModel(id: $id, isSelected: $isSelected, userId: $userId, ngoName: $ngoName, address: $address, phoneNo: $phoneNo, bankName: $bankName, accountNo: $accountNo, isVerified: $isVerified, cerficateUrl: $cerficateUrl)';
}


}

/// @nodoc
abstract mixin class _$NGOModelCopyWith<$Res> implements $NGOModelCopyWith<$Res> {
  factory _$NGOModelCopyWith(_NGOModel value, $Res Function(_NGOModel) _then) = __$NGOModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, bool? isSelected,@JsonKey(name: 'userId') String? userId,@JsonKey(name: 'ngoName') String? ngoName,@JsonKey(name: 'address') String? address,@JsonKey(name: 'phoneNo') String? phoneNo,@JsonKey(name: 'bankName') String? bankName,@JsonKey(name: 'accountNo') String? accountNo,@JsonKey(name: 'isVerified') bool? isVerified,@JsonKey(name: 'certificateUrl') String? cerficateUrl
});




}
/// @nodoc
class __$NGOModelCopyWithImpl<$Res>
    implements _$NGOModelCopyWith<$Res> {
  __$NGOModelCopyWithImpl(this._self, this._then);

  final _NGOModel _self;
  final $Res Function(_NGOModel) _then;

/// Create a copy of NGOModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? isSelected = freezed,Object? userId = freezed,Object? ngoName = freezed,Object? address = freezed,Object? phoneNo = freezed,Object? bankName = freezed,Object? accountNo = freezed,Object? isVerified = freezed,Object? cerficateUrl = freezed,}) {
  return _then(_NGOModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,ngoName: freezed == ngoName ? _self.ngoName : ngoName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNo: freezed == phoneNo ? _self.phoneNo : phoneNo // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,cerficateUrl: freezed == cerficateUrl ? _self.cerficateUrl : cerficateUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
