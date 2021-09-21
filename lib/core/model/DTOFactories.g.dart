// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOFactories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOFactories _$DTOFactoriesFromJson(Map<String, dynamic> json) {
  return DTOFactories(
    Id: json['Id'] as int?,
    Title: json['Title'] as String?,
    Lat: (json['Lat'] as num?)?.toDouble(),
    Lon: (json['Lon'] as num?)?.toDouble(),
    Address: json['Address'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    IsDeleted: json['IsDeleted'] as int?,
  );
}

Map<String, dynamic> _$DTOFactoriesToJson(DTOFactories instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Title': instance.Title,
      'Lat': instance.Lat,
      'Lon': instance.Lon,
      'Address': instance.Address,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
    };
