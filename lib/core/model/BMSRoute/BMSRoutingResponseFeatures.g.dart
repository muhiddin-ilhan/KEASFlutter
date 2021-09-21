// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingResponseFeatures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingResponseFeatures _$BMSRoutingResponseFeaturesFromJson(
    Map<String, dynamic> json) {
  return BMSRoutingResponseFeatures(
    type: json['type'] as String?,
    properties: json['properties'] == null
        ? null
        : BMSRoutingResponseProperties.fromJson(
            json['properties'] as Map<String, dynamic>),
    geometry: json['geometry'] == null
        ? null
        : BMSRoutingResponseGeometry.fromJson(
            json['geometry'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BMSRoutingResponseFeaturesToJson(
        BMSRoutingResponseFeatures instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };
