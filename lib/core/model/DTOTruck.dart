import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/DTOVendor.dart';

part 'DTOTruck.g.dart';

@JsonSerializable()
class DTOTruck extends BaseModel<DTOTruck> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  int? VendorId;
  // ignore: non_constant_identifier_names
  String? Brand;
  // ignore: non_constant_identifier_names
  String? Model;
  // ignore: non_constant_identifier_names
  int? IsTipper;
  // ignore: non_constant_identifier_names
  int? IsUsed;
  // ignore: non_constant_identifier_names
  String? Plaque;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;
  // ignore: non_constant_identifier_names
  DTOVendor? Vendor;

  DTOTruck({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.VendorId,
    // ignore: non_constant_identifier_names
    this.Brand,
    // ignore: non_constant_identifier_names
    this.Model,
    // ignore: non_constant_identifier_names
    this.IsTipper,
    // ignore: non_constant_identifier_names
    this.IsUsed,
    // ignore: non_constant_identifier_names
    this.Plaque,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
    // ignore: non_constant_identifier_names
    this.Vendor,
  });

  factory DTOTruck.fromJson(Map<String, dynamic> json) {
    return _$DTOTruckFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOTruckToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOTruckFromJson(json);
  }
}
