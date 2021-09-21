// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTODriverRoute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTODriverRoute _$DTODriverRouteFromJson(Map<String, dynamic> json) {
  return DTODriverRoute(
    Id: json['Id'] as int?,
    Lat: (json['Lat'] as num?)?.toDouble(),
    Lon: (json['Lon'] as num?)?.toDouble(),
    Speed: (json['Speed'] as num?)?.toDouble(),
    UserId: json['UserId'] as int?,
    TaskId: json['TaskId'] as int?,
    TruckId: json['TruckId'] as int?,
    RelationId: json['RelationId'] as int?,
    IsDangerArea: json['IsDangerArea'] as int?,
    IsBreakArea: json['IsBreakArea'] as int?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    IsDeleted: json['IsDeleted'] as int?,
  );
}

Map<String, dynamic> _$DTODriverRouteToJson(DTODriverRoute instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Lat': instance.Lat,
      'Lon': instance.Lon,
      'Speed': instance.Speed,
      'UserId': instance.UserId,
      'TaskId': instance.TaskId,
      'TruckId': instance.TruckId,
      'RelationId': instance.RelationId,
      'IsDangerArea': instance.IsDangerArea,
      'IsBreakArea': instance.IsBreakArea,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
    };
