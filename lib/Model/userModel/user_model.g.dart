// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String? ?? '',
  email: json['email'] as String? ?? '',
  token: json['token'] as String? ?? '',
  userRole: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.user,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
      'role': _$RoleEnumMap[instance.userRole],
    };

const _$RoleEnumMap = {Role.admin: 'admin', Role.user: 'user'};
