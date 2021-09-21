// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingResponseGeometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingResponseGeometry _$BMSRoutingResponseGeometryFromJson(
    Map<String, dynamic> json) {
  return BMSRoutingResponseGeometry(
    type: json['type'] as String?,
    coordinates: (json['coordinates'] as List<dynamic>?)
        ?.map((e) =>
            (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
        .toList(),
  );
}

Map<String, dynamic> _$BMSRoutingResponseGeometryToJson(
        BMSRoutingResponseGeometry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
