import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTOBackground.g.dart';

@JsonSerializable()
class DTOBackground extends BaseModel<DTOBackground> {
  // ignore: non_constant_identifier_names
  int? ShipmentId;
  // ignore: non_constant_identifier_names
  int? UserId;
  // ignore: non_constant_identifier_names
  int? TruckId;
  // ignore: non_constant_identifier_names
  int? RelationId;
  // ignore: non_constant_identifier_names
  List<double>? FactoryCoord;
  // ignore: non_constant_identifier_names
  String? Token;

  DTOBackground({
    // ignore: non_constant_identifier_names
    this.ShipmentId,
    // ignore: non_constant_identifier_names
    this.UserId,
    // ignore: non_constant_identifier_names
    this.TruckId,
    // ignore: non_constant_identifier_names
    this.RelationId,
    // ignore: non_constant_identifier_names
    this.FactoryCoord,
    // ignore: non_constant_identifier_names
    this.Token,
  });

  factory DTOBackground.fromJson(Map<String, dynamic> json) {
    return _$DTOBackgroundFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOBackgroundToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOBackgroundFromJson(json);
  }
}
