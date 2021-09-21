// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BMSRoutingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMSRoutingResponse _$BMSRoutingResponseFromJson(Map<String, dynamic> json) {
  return BMSRoutingResponse(
    code: json['code'] as int?,
    message: json['message'] as String?,
    manifestData: json['manifestData'],
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => BMSRoutingResponseData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BMSRoutingResponseToJson(BMSRoutingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'manifestData': instance.manifestData,
      'data': instance.data,
    };
