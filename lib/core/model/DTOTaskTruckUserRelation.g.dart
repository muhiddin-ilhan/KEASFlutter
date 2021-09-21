// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOTaskTruckUserRelation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOTaskTruckUserRelation _$DTOTaskTruckUserRelationFromJson(
    Map<String, dynamic> json) {
  return DTOTaskTruckUserRelation(
    Id: json['Id'] as int?,
    TaskId: json['TaskId'] as int?,
    TruckId: json['TruckId'] as int?,
    UserId: json['UserId'] as int?,
    EntryDate: json['EntryDate'] == null
        ? null
        : DateTime.parse(json['EntryDate'] as String),
    DischargeDate: json['DischargeDate'] == null
        ? null
        : DateTime.parse(json['DischargeDate'] as String),
    IsDeleted: json['IsDeleted'] as int?,
    IsPriority: json['IsPriority'] as int?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    Task: json['Task'] == null
        ? null
        : DTOTask.fromJson(json['Task'] as Map<String, dynamic>),
    Truck: json['Truck'] == null
        ? null
        : DTOTruck.fromJson(json['Truck'] as Map<String, dynamic>),
    User: json['User'] == null
        ? null
        : DTOUser.fromJson(json['User'] as Map<String, dynamic>),
    Photo: json['Photo'] == null
        ? null
        : DTOPhoto.fromJson(json['Photo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DTOTaskTruckUserRelationToJson(
        DTOTaskTruckUserRelation instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'TaskId': instance.TaskId,
      'TruckId': instance.TruckId,
      'UserId': instance.UserId,
      'EntryDate': instance.EntryDate?.toIso8601String(),
      'DischargeDate': instance.DischargeDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
      'IsPriority': instance.IsPriority,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'Task': instance.Task,
      'Truck': instance.Truck,
      'User': instance.User,
      'Photo': instance.Photo,
    };
