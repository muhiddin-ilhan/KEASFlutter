import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTODriverRoute.g.dart';

@JsonSerializable()
class DTODriverRoute extends BaseModel<DTODriverRoute> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  double? Lat;
  // ignore: non_constant_identifier_names
  double? Lon;
  // ignore: non_constant_identifier_names
  double? Speed;
  // ignore: non_constant_identifier_names
  int? UserId;
  // ignore: non_constant_identifier_names
  int? TaskId;
  // ignore: non_constant_identifier_names
  int? TruckId;
  // ignore: non_constant_identifier_names
  int? RelationId;
  // ignore: non_constant_identifier_names
  int? IsDangerArea;
  // ignore: non_constant_identifier_names
  int? IsBreakArea;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;

  DTODriverRoute({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.Lat,
    // ignore: non_constant_identifier_names
    this.Lon,
    // ignore: non_constant_identifier_names
    this.Speed,
    // ignore: non_constant_identifier_names
    this.UserId,
    // ignore: non_constant_identifier_names
    this.TaskId,
    // ignore: non_constant_identifier_names
    this.TruckId,
    // ignore: non_constant_identifier_names
    this.RelationId,
    // ignore: non_constant_identifier_names
    this.IsDangerArea,
    // ignore: non_constant_identifier_names
    this.IsBreakArea,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.IsDeleted
  });

  factory DTODriverRoute.fromJson(Map<String, dynamic> json) {
    return _$DTODriverRouteFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTODriverRouteToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTODriverRouteFromJson(json);
  }
}
