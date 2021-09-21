// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOResult _$DTOResultFromJson(Map<String, dynamic> json) {
  return DTOResult(
    IsSuccess: json['IsSuccess'] as bool?,
    ResultMessage: json['ResultMessage'] as String?,
  );
}

Map<String, dynamic> _$DTOResultToJson(DTOResult instance) => <String, dynamic>{
      'IsSuccess': instance.IsSuccess,
      'ResultMessage': instance.ResultMessage,
    };
