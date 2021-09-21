import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTODangerArea.g.dart';

@JsonSerializable()
class DTODangerArea extends BaseModel<DTODangerArea> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  String? AreaTitle;
  // ignore: non_constant_identifier_names
  String? Polygon;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;

  DTODangerArea({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.AreaTitle,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.Polygon,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
  });

  factory DTODangerArea.fromJson(Map<String, dynamic> json) {
    return _$DTODangerAreaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTODangerAreaToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTODangerAreaFromJson(json);
  }
}
