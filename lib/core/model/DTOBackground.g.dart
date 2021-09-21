// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOBackground.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOBackground _$DTOBackgroundFromJson(Map<String, dynamic> json) {
  return DTOBackground(
    ShipmentId: json['ShipmentId'] as int?,
    UserId: json['UserId'] as int?,
    TruckId: json['TruckId'] as int?,
    RelationId: json['RelationId'] as int?,
    FactoryCoord: (json['FactoryCoord'] as List<dynamic>?)
        ?.map((e) => (e as num).toDouble())
        .toList(),
    Token: json['Token'] as String?,
  );
}

Map<String, dynamic> _$DTOBackgroundToJson(DTOBackground instance) =>
    <String, dynamic>{
      'ShipmentId': instance.ShipmentId,
      'UserId': instance.UserId,
      'TruckId': instance.TruckId,
      'RelationId': instance.RelationId,
      'FactoryCoord': instance.FactoryCoord,
      'Token': instance.Token,
    };
