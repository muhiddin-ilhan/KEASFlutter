import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTOFactories.g.dart';

@JsonSerializable()
class DTOFactories extends BaseModel<DTOFactories> {
  // ignore: non_constant_identifier_names
  int? Id;
  // ignore: non_constant_identifier_names
  String? Title;
  // ignore: non_constant_identifier_names
  double? Lat;
  // ignore: non_constant_identifier_names
  double? Lon;
  // ignore: non_constant_identifier_names
  String? Address;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;
  // ignore: non_constant_identifier_names
  int? IsDeleted;

  DTOFactories({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.Title,
    // ignore: non_constant_identifier_names
    this.Lat,
    // ignore: non_constant_identifier_names
    this.Lon,
    // ignore: non_constant_identifier_names
    this.Address,
    // ignore: non_constant_identifier_names
    this.RecordDate,
    // ignore: non_constant_identifier_names
    this.IsDeleted,
  });

  factory DTOFactories.fromJson(Map<String, dynamic> json) {
    return _$DTOFactoriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOFactoriesToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOFactoriesFromJson(json);
  }
}
