// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOTask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOTask _$DTOTaskFromJson(Map<String, dynamic> json) {
  return DTOTask(
    Id: json['Id'] as int?,
    ConsumerName: json['ConsumerName'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    RegistrantName: json['RegistrantName'] as String?,
    FactoryId: json['FactoryId'] as int?,
    TaskTitle: json['TaskTitle'] as String?,
    IsDeleted: json['IsDeleted'] as int?,
    VendorId: json['VendorId'] as int?,
    GoodsLoadingAreaLat: (json['GoodsLoadingAreaLat'] as num?)?.toDouble(),
    GoodsLoadingAreaLon: (json['GoodsLoadingAreaLon'] as num?)?.toDouble(),
    Factory: json['Factory'] == null
        ? null
        : DTOFactories.fromJson(json['Factory'] as Map<String, dynamic>),
    Vendor: json['Vendor'] == null
        ? null
        : DTOVendor.fromJson(json['Vendor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DTOTaskToJson(DTOTask instance) => <String, dynamic>{
      'Id': instance.Id,
      'ConsumerName': instance.ConsumerName,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'RegistrantName': instance.RegistrantName,
      'FactoryId': instance.FactoryId,
      'TaskTitle': instance.TaskTitle,
      'IsDeleted': instance.IsDeleted,
      'VendorId': instance.VendorId,
      'GoodsLoadingAreaLat': instance.GoodsLoadingAreaLat,
      'GoodsLoadingAreaLon': instance.GoodsLoadingAreaLon,
      'Factory': instance.Factory,
      'Vendor': instance.Vendor,
    };
