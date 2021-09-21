// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTOUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOUser _$DTOUserFromJson(Map<String, dynamic> json) {
  return DTOUser(
    Id: json['Id'] as int?,
    VendorId: json['VendorId'] as int?,
    Name: json['Name'] as String?,
    SurName: json['SurName'] as String?,
    Email: json['Email'] as String?,
    Password: json['Password'] as String?,
    Identity: json['Identity'] as String?,
    Phone: json['Phone'] as String?,
    RecordDate: json['RecordDate'] == null
        ? null
        : DateTime.parse(json['RecordDate'] as String),
    IsDeleted: json['IsDeleted'] as int?,
    RoleId: json['RoleId'] as int?,
    Token: json['Token'] as String?,
    LoginResult: json['LoginResult'] == null
        ? null
        : DTOResult.fromJson(json['LoginResult'] as Map<String, dynamic>),
    Role: json['Role'] == null
        ? null
        : DTORole.fromJson(json['Role'] as Map<String, dynamic>),
    Vendor: json['Vendor'] == null
        ? null
        : DTOVendor.fromJson(json['Vendor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DTOUserToJson(DTOUser instance) => <String, dynamic>{
      'Id': instance.Id,
      'VendorId': instance.VendorId,
      'Name': instance.Name,
      'SurName': instance.SurName,
      'Email': instance.Email,
      'Password': instance.Password,
      'Identity': instance.Identity,
      'Phone': instance.Phone,
      'RecordDate': instance.RecordDate?.toIso8601String(),
      'IsDeleted': instance.IsDeleted,
      'RoleId': instance.RoleId,
      'Token': instance.Token,
      'LoginResult': instance.LoginResult,
      'Vendor': instance.Vendor,
      'Role': instance.Role,
    };
