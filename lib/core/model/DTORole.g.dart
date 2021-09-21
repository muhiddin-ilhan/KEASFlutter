// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTORole.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTORole _$DTORoleFromJson(Map<String, dynamic> json) {
  return DTORole(
    Id: json['Id'] as int?,
    Title: json['Title'] as String?,
    RoleCode: json['RoleCode'] as int?,
    IsDeleted: json['IsDeleted'] as int?,
  );
}

Map<String, dynamic> _$DTORoleToJson(DTORole instance) => <String, dynamic>{
      'Id': instance.Id,
      'Title': instance.Title,
      'RoleCode': instance.RoleCode,
      'IsDeleted': instance.IsDeleted,
    };
