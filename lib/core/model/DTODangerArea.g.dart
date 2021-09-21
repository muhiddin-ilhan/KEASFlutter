// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTODangerArea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTODangerArea _$DTODangerAreaFromJson(Map<String, dynamic> json) {
  return DTODangerArea(
    Id: json['Id'] as int?,
    AreaTitle: json['AreaTitle'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    Polygon: json['Polygon'] as String?,
    IsDeleted: json['IsDeleted'] as int?,
  );
}

Map<String, dynamic> _$DTODangerAreaToJson(DTODangerArea instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'AreaTitle': instance.AreaTitle,
      'Polygon': instance.Polygon,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
    };
