// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOTruck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOTruck _$DTOTruckFromJson(Map<String, dynamic> json) {
  return DTOTruck(
    Id: json['Id'] as int?,
    VendorId: json['VendorId'] as int?,
    Brand: json['Brand'] as String?,
    Model: json['Model'] as String?,
    IsTipper: json['IsTipper'] as int?,
    IsUsed: json['IsUsed'] as int?,
    Plaque: json['Plaque'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    IsDeleted: json['IsDeleted'] as int?,
    Vendor: json['Vendor'] == null
        ? null
        : DTOVendor.fromJson(json['Vendor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DTOTruckToJson(DTOTruck instance) => <String, dynamic>{
      'Id': instance.Id,
      'VendorId': instance.VendorId,
      'Brand': instance.Brand,
      'Model': instance.Model,
      'IsTipper': instance.IsTipper,
      'IsUsed': instance.IsUsed,
      'Plaque': instance.Plaque,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
      'Vendor': instance.Vendor,
    };
