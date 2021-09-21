// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingRequestOption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingRequestOption _$BMSRoutingRequestOptionFromJson(
    Map<String, dynamic> json) {
  return BMSRoutingRequestOption(
    liveTraffic: json['liveTraffic'] as bool?,
    alternativeRoute: json['alternativeRoute'] as bool?,
    alternativeCount: json['alternativeCount'] as int?,
    snapMaxDistance: json['snapMaxDistance'] as int?,
    costType: json['costType'] as int?,
    isCar: json['isCar'] as bool?,
    isTruck: json['isTruck'] as bool?,
    isPedestrian: json['isPedestrian'] as bool?,
    avoidToolRoad: json['avoidToolRoad'] as bool?,
    avoidHighway: json['avoidHighway'] as bool?,
    useFerry: json['useFerry'] as bool?,
    avoidPrivateRoad: json['avoidPrivateRoad'] as bool?,
    avoidRestrictedRoad: json['avoidRestrictedRoad'] as bool?,
    useBoat: json['useBoat'] as bool?,
    isBus: json['isBus'] as bool?,
    getManifest: json['getManifest'] as bool?,
  );
}

Map<String, dynamic> _$BMSRoutingRequestOptionToJson(
        BMSRoutingRequestOption instance) =>
    <String, dynamic>{
      'liveTraffic': instance.liveTraffic,
      'alternativeRoute': instance.alternativeRoute,
      'alternativeCount': instance.alternativeCount,
      'snapMaxDistance': instance.snapMaxDistance,
      'costType': instance.costType,
      'isCar': instance.isCar,
      'isTruck': instance.isTruck,
      'isPedestrian': instance.isPedestrian,
      'avoidToolRoad': instance.avoidToolRoad,
      'avoidHighway': instance.avoidHighway,
      'useFerry': instance.useFerry,
      'avoidPrivateRoad': instance.avoidPrivateRoad,
      'avoidRestrictedRoad': instance.avoidRestrictedRoad,
      'useBoat': instance.useBoat,
      'isBus': instance.isBus,
      'getManifest': instance.getManifest,
    };
