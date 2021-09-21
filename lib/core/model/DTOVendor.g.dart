// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOVendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOVendor _$DTOVendorFromJson(Map<String, dynamic> json) {
  return DTOVendor(
    Id: json['Id'] as int?,
    Title: json['Title'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    IsDeleted: json['IsDeleted'] as int?,
  );
}

Map<String, dynamic> _$DTOVendorToJson(DTOVendor instance) => <String, dynamic>{
      'Id': instance.Id,
      'Title': instance.Title,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
    };
