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

@JsonKey(name: 'donationId') String? get donationId;@JsonKey(name: 'isExpanded') bool? get isExpanded;@JsonKey(name: 'method') DonationMethod? get method;@JsonKey(name: 'ngoName') String? get ngoName;@JsonKey(name: 'bankName') String? get bankName;@JsonKey(name: 'accountNo') String? get accountNo;@JsonKey(name: 'amount') double? get amount;@JsonKey(name: 'userId') String? get userId;@JsonKey(name: 'userEmail') String? get userEmail;@JsonKey(name: 'userprofile') String? get userProfile;@JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) DateTime? get timeStamp;
/// Create a copy of DonationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationModelCopyWith<DonationModel> get copyWith => _$DonationModelCopyWithImpl<DonationModel>(this as DonationModel, _$identity);

  /// Serializes this DonationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationModel&&(identical(other.donationId, donationId) || other.donationId == donationId)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.method, method) || other.method == method)&&(identical(other.ngoName, ngoName) || other.ngoName == ngoName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,donationId,isExpanded,method,ngoName,bankName,accountNo,amount,userId,userEmail,userProfile,timeStamp);

@override
String toString() {
  return 'DonationModel(donationId: $donationId, isExpanded: $isExpanded, method: $method, ngoName: $ngoName, bankName: $bankName, accountNo: $accountNo, amount: $amount, userId: $userId, userEmail: $userEmail, userProfile: $userProfile, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $DonationModelCopyWith<$Res>  {
  factory $DonationModelCopyWith(DonationModel value, $Res Function(DonationModel) _then) = _$DonationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'donationId') String? donationId,@JsonKey(name: 'isExpanded') bool? isExpanded,@JsonKey(name: 'method') DonationMethod? method,@JsonKey(name: 'ngoName') String? ngoName,@JsonKey(name: 'bankName') String? bankName,@JsonKey(name: 'accountNo') String? accountNo,@JsonKey(name: 'amount') double? amount,@JsonKey(name: 'userId') String? userId,@JsonKey(name: 'userEmail') String? userEmail,@JsonKey(name: 'userprofile') String? userProfile,@JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) DateTime? timeStamp
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
@pragma('vm:prefer-inline') @override $Res call({Object? donationId = freezed,Object? isExpanded = freezed,Object? method = freezed,Object? ngoName = freezed,Object? bankName = freezed,Object? accountNo = freezed,Object? amount = freezed,Object? userId = freezed,Object? userEmail = freezed,Object? userProfile = freezed,Object? timeStamp = freezed,}) {
  return _then(_self.copyWith(
donationId: freezed == donationId ? _self.donationId : donationId // ignore: cast_nullable_to_non_nullable
as String?,isExpanded: freezed == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as DonationMethod?,ngoName: freezed == ngoName ? _self.ngoName : ngoName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,userProfile: freezed == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as String?,timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'donationId')  String? donationId, @JsonKey(name: 'isExpanded')  bool? isExpanded, @JsonKey(name: 'method')  DonationMethod? method, @JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo, @JsonKey(name: 'amount')  double? amount, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'userEmail')  String? userEmail, @JsonKey(name: 'userprofile')  String? userProfile, @JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)  DateTime? timeStamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
return $default(_that.donationId,_that.isExpanded,_that.method,_that.ngoName,_that.bankName,_that.accountNo,_that.amount,_that.userId,_that.userEmail,_that.userProfile,_that.timeStamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'donationId')  String? donationId, @JsonKey(name: 'isExpanded')  bool? isExpanded, @JsonKey(name: 'method')  DonationMethod? method, @JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo, @JsonKey(name: 'amount')  double? amount, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'userEmail')  String? userEmail, @JsonKey(name: 'userprofile')  String? userProfile, @JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)  DateTime? timeStamp)  $default,) {final _that = this;
switch (_that) {
case _DonationModel():
return $default(_that.donationId,_that.isExpanded,_that.method,_that.ngoName,_that.bankName,_that.accountNo,_that.amount,_that.userId,_that.userEmail,_that.userProfile,_that.timeStamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'donationId')  String? donationId, @JsonKey(name: 'isExpanded')  bool? isExpanded, @JsonKey(name: 'method')  DonationMethod? method, @JsonKey(name: 'ngoName')  String? ngoName, @JsonKey(name: 'bankName')  String? bankName, @JsonKey(name: 'accountNo')  String? accountNo, @JsonKey(name: 'amount')  double? amount, @JsonKey(name: 'userId')  String? userId, @JsonKey(name: 'userEmail')  String? userEmail, @JsonKey(name: 'userprofile')  String? userProfile, @JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)  DateTime? timeStamp)?  $default,) {final _that = this;
switch (_that) {
case _DonationModel() when $default != null:
return $default(_that.donationId,_that.isExpanded,_that.method,_that.ngoName,_that.bankName,_that.accountNo,_that.amount,_that.userId,_that.userEmail,_that.userProfile,_that.timeStamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DonationModel implements DonationModel {
   _DonationModel({@JsonKey(name: 'donationId') this.donationId = '', @JsonKey(name: 'isExpanded') this.isExpanded = false, @JsonKey(name: 'method') this.method = DonationMethod.card, @JsonKey(name: 'ngoName') this.ngoName = '', @JsonKey(name: 'bankName') this.bankName = '', @JsonKey(name: 'accountNo') this.accountNo = '', @JsonKey(name: 'amount') this.amount = 0.0, @JsonKey(name: 'userId') this.userId = '', @JsonKey(name: 'userEmail') this.userEmail = '', @JsonKey(name: 'userprofile') this.userProfile = '', @JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) this.timeStamp});
  factory _DonationModel.fromJson(Map<String, dynamic> json) => _$DonationModelFromJson(json);

@override@JsonKey(name: 'donationId') final  String? donationId;
@override@JsonKey(name: 'isExpanded') final  bool? isExpanded;
@override@JsonKey(name: 'method') final  DonationMethod? method;
@override@JsonKey(name: 'ngoName') final  String? ngoName;
@override@JsonKey(name: 'bankName') final  String? bankName;
@override@JsonKey(name: 'accountNo') final  String? accountNo;
@override@JsonKey(name: 'amount') final  double? amount;
@override@JsonKey(name: 'userId') final  String? userId;
@override@JsonKey(name: 'userEmail') final  String? userEmail;
@override@JsonKey(name: 'userprofile') final  String? userProfile;
@override@JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) final  DateTime? timeStamp;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DonationModel&&(identical(other.donationId, donationId) || other.donationId == donationId)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.method, method) || other.method == method)&&(identical(other.ngoName, ngoName) || other.ngoName == ngoName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,donationId,isExpanded,method,ngoName,bankName,accountNo,amount,userId,userEmail,userProfile,timeStamp);

@override
String toString() {
  return 'DonationModel(donationId: $donationId, isExpanded: $isExpanded, method: $method, ngoName: $ngoName, bankName: $bankName, accountNo: $accountNo, amount: $amount, userId: $userId, userEmail: $userEmail, userProfile: $userProfile, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class _$DonationModelCopyWith<$Res> implements $DonationModelCopyWith<$Res> {
  factory _$DonationModelCopyWith(_DonationModel value, $Res Function(_DonationModel) _then) = __$DonationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'donationId') String? donationId,@JsonKey(name: 'isExpanded') bool? isExpanded,@JsonKey(name: 'method') DonationMethod? method,@JsonKey(name: 'ngoName') String? ngoName,@JsonKey(name: 'bankName') String? bankName,@JsonKey(name: 'accountNo') String? accountNo,@JsonKey(name: 'amount') double? amount,@JsonKey(name: 'userId') String? userId,@JsonKey(name: 'userEmail') String? userEmail,@JsonKey(name: 'userprofile') String? userProfile,@JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) DateTime? timeStamp
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
@override @pragma('vm:prefer-inline') $Res call({Object? donationId = freezed,Object? isExpanded = freezed,Object? method = freezed,Object? ngoName = freezed,Object? bankName = freezed,Object? accountNo = freezed,Object? amount = freezed,Object? userId = freezed,Object? userEmail = freezed,Object? userProfile = freezed,Object? timeStamp = freezed,}) {
  return _then(_DonationModel(
donationId: freezed == donationId ? _self.donationId : donationId // ignore: cast_nullable_to_non_nullable
as String?,isExpanded: freezed == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as DonationMethod?,ngoName: freezed == ngoName ? _self.ngoName : ngoName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,userProfile: freezed == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as String?,timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
