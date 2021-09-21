// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingResponseProperties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingResponseProperties _$BMSRoutingResponsePropertiesFromJson(
    Map<String, dynamic> json) {
  return BMSRoutingResponseProperties(
    fromNodeId: json['fromNodeId'] as int?,
    toNodeId: json['toNodeId'] as int?,
    basarId: json['basarId'] as int?,
    fc: json['fc'] as int?,
    df: json['df'] as int?,
    distance: (json['distance'] as num?)?.toDouble(),
    duration: (json['duration'] as num?)?.toDouble(),
    averageSpeed: json['averageSpeed'] as int?,
    averageTrafficSpeed: (json['averageTrafficSpeed'] as num?)?.toDouble(),
    speedLimit: json['speedLimit'] as int?,
    typeName: json['typeName'] as String?,
    constructionName: json['constructionName'] as String?,
    adjacentEdges: json['adjacentEdges'],
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$BMSRoutingResponsePropertiesToJson(
        BMSRoutingResponseProperties instance) =>
    <String, dynamic>{
      'fromNodeId': instance.fromNodeId,
      'toNodeId': instance.toNodeId,
      'basarId': instance.basarId,
      'fc': instance.fc,
      'df': instance.df,
      'distance': instance.distance,
      'duration': instance.duration,
      'averageSpeed': instance.averageSpeed,
      'averageTrafficSpeed': instance.averageTrafficSpeed,
      'speedLimit': instance.speedLimit,
      'typeName': instance.typeName,
      'constructionName': instance.constructionName,
      'adjacentEdges': instance.adjacentEdges,
      'name': instance.name,
    };
