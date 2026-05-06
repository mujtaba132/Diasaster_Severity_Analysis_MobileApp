// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DonationModel _$DonationModelFromJson(Map<String, dynamic> json) =>
    _DonationModel(
      ngoName: json['ngoName'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      accountNo: json['accountNo'] as String? ?? '',
    );

Map<String, dynamic> _$DonationModelToJson(_DonationModel instance) =>
    <String, dynamic>{
      'ngoName': instance.ngoName,
      'bankName': instance.bankName,
      'accountNo': instance.accountNo,
    };
