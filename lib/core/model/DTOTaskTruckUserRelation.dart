import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/DTOPhoto.dart';
import 'package:nestle_app/core/model/DTOTask.dart';
import 'package:nestle_app/core/model/DTOTruck.dart';
import 'package:nestle_app/core/model/DTOUser.dart';

part 'DTOTaskTruckUserRelation.g.dart';

@JsonSerializable()
class DTOTaskTruckUserRelation extends BaseModel<DTOTaskTruckUserRelation> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  int? TaskId;
  // ignore: non_constant_identifier_names
  int? TruckId;
  // ignore: non_constant_identifier_names
  int? UserId;
  // ignore: non_constant_identifier_names
  DateTime? EntryDate;
  // ignore: non_constant_identifier_names
  DateTime? DischargeDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;
  // ignore: non_constant_identifier_names
  int? IsPriority;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  DTOTask? Task;
  // ignore: non_constant_identifier_names
  DTOTruck? Truck;
  // ignore: non_constant_identifier_names
  DTOUser? User;
  // ignore: non_constant_identifier_names
  DTOPhoto? Photo;

  DTOTaskTruckUserRelation({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.TaskId,
    // ignore: non_constant_identifier_names
    this.TruckId,
    // ignore: non_constant_identifier_names
    this.UserId,
    // ignore: non_constant_identifier_names
    this.EntryDate,
    // ignore: non_constant_identifier_names
    this.DischargeDate,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
    // ignore: non_constant_identifier_names
    this.IsPriority,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.Task,
    // ignore: non_constant_identifier_names
    this.Truck,
    // ignore: non_constant_identifier_names
    this.User,
    // ignore: non_constant_identifier_names
    this.Photo,
  });

  factory DTOTaskTruckUserRelation.fromJson(Map<String, dynamic> json) {
    return _$DTOTaskTruckUserRelationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOTaskTruckUserRelationToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOTaskTruckUserRelationFromJson(json);
  }
}
