// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingRequest _$BMSRoutingRequestFromJson(Map<String, dynamic> json) {
  return BMSRoutingRequest(
    origin: json['origin'] as String?,
    destination: json['destination'] as String?,
    wayPoints: json['wayPoints'] as String?,
    addRestDuration: json['addRestDuration'] as bool?,
    restDuration: json['restDuration'] as int?,
    requestOptions: json['requestOptions'] == null
        ? null
        : BMSRoutingRequestOption.fromJson(
            json['requestOptions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BMSRoutingRequestToJson(BMSRoutingRequest instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'wayPoints': instance.wayPoints,
      'addRestDuration': instance.addRestDuration,
      'restDuration': instance.restDuration,
      'requestOptions': instance.requestOptions,
    };
