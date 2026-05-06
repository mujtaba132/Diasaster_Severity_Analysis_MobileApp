// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ngo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NGOModel _$NGOModelFromJson(Map<String, dynamic> json) => _NGOModel(
  id: json['id'] as String? ?? '',
  isSelected: json['isSelected'] as bool? ?? false,
  userId: json['userId'] as String? ?? '',
  ngoName: json['ngoName'] as String? ?? '',
  address: json['address'] as String? ?? '',
  phoneNo: json['phoneNo'] as String? ?? '',
  bankName: json['bankName'] as String? ?? '',
  accountNo: json['accountNo'] as String? ?? '',
  isVerified: json['isVerified'] as bool? ?? false,
  cerficateUrl: json['certificateUrl'] as String? ?? '',
);

Map<String, dynamic> _$NGOModelToJson(_NGOModel instance) => <String, dynamic>{
  'id': instance.id,
  'isSelected': instance.isSelected,
  'userId': instance.userId,
  'ngoName': instance.ngoName,
  'address': instance.address,
  'phoneNo': instance.phoneNo,
  'bankName': instance.bankName,
  'accountNo': instance.accountNo,
  'isVerified': instance.isVerified,
  'certificateUrl': instance.cerficateUrl,
};
