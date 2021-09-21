// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOFactoryEntry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOFactoryEntry _$DTOFactoryEntryFromJson(Map<String, dynamic> json) {
  return DTOFactoryEntry(
    TaskId: json['TaskId'] as int?,
    UserId: json['UserId'] as int?,
    TruckId: json['TruckId'] as int?,
    RelationId: json['RelationId'] as int?,
    RemainingDistance: (json['RemainingDistance'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$DTOFactoryEntryToJson(DTOFactoryEntry instance) =>
    <String, dynamic>{
      'TaskId': instance.TaskId,
      'UserId': instance.UserId,
      'TruckId': instance.TruckId,
      'RelationId': instance.RelationId,
      'RemainingDistance': instance.RemainingDistance,
    };
