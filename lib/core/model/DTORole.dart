import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTORole.g.dart';

@JsonSerializable()
class DTORole extends BaseModel<DTORole> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  String? Title;
  // ignore: non_constant_identifier_names
  int? RoleCode;
  // ignore: non_constant_identifier_names
  int? IsDeleted;

  DTORole({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.Title,
    // ignore: non_constant_identifier_names
    this.RoleCode,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
  });

  factory DTORole.fromJson(Map<String, dynamic> json) {
    return _$DTORoleFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTORoleToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTORoleFromJson(json);
  }
}
