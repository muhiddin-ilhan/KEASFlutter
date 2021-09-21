// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOPhoto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOPhoto _$DTOPhotoFromJson(Map<String, dynamic> json) {
  return DTOPhoto(
    Id: json['Id'] as String?,
    Name: json['Name'] as String?,
    Extension: json['Extension'] as String?,
    Path: json['Path'] as String?,
    SubPath: json['SubPath'] as String?,
    ForeignId: json['ForeignId'] as int?,
    ForeignTableName: json['ForeignTableName'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
  );
}

Map<String, dynamic> _$DTOPhotoToJson(DTOPhoto instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Extension': instance.Extension,
      'Path': instance.Path,
      'SubPath': instance.SubPath,
      'ForeignId': instance.ForeignId,
      'ForeignTableName': instance.ForeignTableName,
      'RecordDate': instance.RecordDate?.toIso8601String(),
    };
