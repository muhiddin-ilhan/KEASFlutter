// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingResponseData _$BMSRoutingResponseDataFromJson(
    Map<String, dynamic> json) {
  return BMSRoutingResponseData(
    type: json['type'] as String?,
    properties: json['properties'] == null
        ? null
        : BMSRoutingResponseProperties.fromJson(
            json['properties'] as Map<String, dynamic>),
    features: (json['features'] as List<dynamic>?)
        ?.map((e) =>
            BMSRoutingResponseFeatures.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BMSRoutingResponseDataToJson(
        BMSRoutingResponseData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'features': instance.features,
    };
