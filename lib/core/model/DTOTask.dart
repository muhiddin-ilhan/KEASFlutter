import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/DTOFactories.dart';
import 'package:nestle_app/core/model/DTOVendor.dart';

part 'DTOTask.g.dart';

@JsonSerializable()
class DTOTask extends BaseModel<DTOTask> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  String? ConsumerName;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  String? RegistrantName;
  // ignore: non_constant_identifier_names
  int? FactoryId;
  // ignore: non_constant_identifier_names
  String? TaskTitle;
  // ignore: non_constant_identifier_names
  int? IsDeleted;
  // ignore: non_constant_identifier_names
  int? VendorId;
  // ignore: non_constant_identifier_names
  double? GoodsLoadingAreaLat;
  // ignore: non_constant_identifier_names
  double? GoodsLoadingAreaLon;
  // ignore: non_constant_identifier_names
  DTOFactories? Factory;
  // ignore: non_constant_identifier_names
  DTOVendor? Vendor;

  DTOTask({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.ConsumerName,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.RegistrantName,
    // ignore: non_constant_identifier_names
    this.FactoryId,
    // ignore: non_constant_identifier_names
    this.TaskTitle,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
    // ignore: non_constant_identifier_names
    this.VendorId,
    // ignore: non_constant_identifier_names
    this.GoodsLoadingAreaLat,
    // ignore: non_constant_identifier_names
    this.GoodsLoadingAreaLon,
    // ignore: non_constant_identifier_names
    this.Factory,
    // ignore: non_constant_identifier_names
    this.Vendor,
  });

  factory DTOTask.fromJson(Map<String, dynamic> json) {
    return _$DTOTaskFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOTaskToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOTaskFromJson(json);
  }
}
