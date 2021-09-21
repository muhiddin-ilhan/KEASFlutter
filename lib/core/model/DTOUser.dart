import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/DTOResult.dart';
import 'package:nestle_app/core/model/DTORole.dart';
import 'package:nestle_app/core/model/DTOVendor.dart';

part 'DTOUser.g.dart';

@JsonSerializable()
class DTOUser extends BaseModel<DTOUser> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  int? VendorId;
  // ignore: non_constant_identifier_names
  String? Name;
  // ignore: non_constant_identifier_names
  String? SurName;
  // ignore: non_constant_identifier_names
  String? Email;
  // ignore: non_constant_identifier_names
  String? Password;
  // ignore: non_constant_identifier_names
  String? Identity;
  // ignore: non_constant_identifier_names
  String? Phone;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;
  // ignore: non_constant_identifier_names
  int? RoleId;
  // ignore: non_constant_identifier_names
  String? Token;
  // ignore: non_constant_identifier_names
  DTOResult? LoginResult;
  // ignore: non_constant_identifier_names
  DTOVendor? Vendor;
  // ignore: non_constant_identifier_names
  DTORole? Role;

  DTOUser({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.VendorId,
    // ignore: non_constant_identifier_names
    this.Name,
    // ignore: non_constant_identifier_names
    this.SurName,
    // ignore: non_constant_identifier_names
    this.Email,
    // ignore: non_constant_identifier_names
    this.Password,
    // ignore: non_constant_identifier_names
    this.Identity,
    // ignore: non_constant_identifier_names
    this.Phone,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
    // ignore: non_constant_identifier_names
    this.RoleId,
    // ignore: non_constant_identifier_names
    this.Token,
    // ignore: non_constant_identifier_names
    this.LoginResult,
    // ignore: non_constant_identifier_names
    this.Role,
    // ignore: non_constant_identifier_names
    this.Vendor,
  });

  factory DTOUser.fromJson(Map<String, dynamic> json) {
    return _$DTOUserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOUserToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOUserFromJson(json);
  }
}
