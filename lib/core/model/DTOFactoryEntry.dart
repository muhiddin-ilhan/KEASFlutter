import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTOFactoryEntry.g.dart';

@JsonSerializable()
class DTOFactoryEntry extends BaseModel<DTOFactoryEntry> {
  // ignore: non_constant_identifier_names
  int? TaskId;
  // ignore: non_constant_identifier_names
  int? UserId;
  // ignore: non_constant_identifier_names
  int? TruckId;
  // ignore: non_constant_identifier_names
  int? RelationId;
  // ignore: non_constant_identifier_names
  double? RemainingDistance;

  DTOFactoryEntry({
    // ignore: non_constant_identifier_names
    this.TaskId,
    // ignore: non_constant_identifier_names
    this.UserId,
    // ignore: non_constant_identifier_names
    this.TruckId,
    // ignore: non_constant_identifier_names
    this.RelationId,
    // ignore: non_constant_identifier_names
    this.RemainingDistance,
  });

  factory DTOFactoryEntry.fromJson(Map<String, dynamic> json) {
    return _$DTOFactoryEntryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOFactoryEntryToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOFactoryEntryFromJson(json);
  }
}
