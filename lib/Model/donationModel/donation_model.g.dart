// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DonationModel _$DonationModelFromJson(Map<String, dynamic> json) =>
    _DonationModel(
      donationId: json['donationId'] as String? ?? '',
      isExpanded: json['isExpanded'] as bool? ?? false,
      method:
          $enumDecodeNullable(_$DonationMethodEnumMap, json['method']) ??
          DonationMethod.card,
      ngoName: json['ngoName'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      accountNo: json['accountNo'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      userId: json['userId'] as String? ?? '',
      userEmail: json['userEmail'] as String? ?? '',
      userProfile: json['userprofile'] as String? ?? '',
      timeStamp: _dateTimeFromJson(json['timeStamp'] as Timestamp),
    );

Map<String, dynamic> _$DonationModelToJson(_DonationModel instance) =>
    <String, dynamic>{
      'donationId': instance.donationId,
      'isExpanded': instance.isExpanded,
      'method': _$DonationMethodEnumMap[instance.method],
      'ngoName': instance.ngoName,
      'bankName': instance.bankName,
      'accountNo': instance.accountNo,
      'amount': instance.amount,
      'userId': instance.userId,
      'userEmail': instance.userEmail,
      'userprofile': instance.userProfile,
      'timeStamp': _dateTimeToJson(instance.timeStamp),
    };

const _$DonationMethodEnumMap = {
  DonationMethod.ngo: 'ngo',
  DonationMethod.card: 'card',
};
