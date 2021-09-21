import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTOVendor.g.dart';

@JsonSerializable()
class DTOVendor extends BaseModel<DTOVendor> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  String? Title;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;

  DTOVendor({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.Title,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
  });

  factory DTOVendor.fromJson(Map<String, dynamic> json) {
    return _$DTOVendorFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOVendorToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOVendorFromJson(json);
  }
}
