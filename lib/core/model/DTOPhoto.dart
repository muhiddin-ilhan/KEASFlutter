import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTOPhoto.g.dart';

@JsonSerializable()
class DTOPhoto extends BaseModel<DTOPhoto> {
  // ignore: non_constant_identifier_names
  String? Id;
  // ignore: non_constant_identifier_names
  String? Name;
  // ignore: non_constant_identifier_names
  String? Extension;
  // ignore: non_constant_identifier_names
  String? Path;
  // ignore: non_constant_identifier_names
  String? SubPath;
  // ignore: non_constant_identifier_names
  int? ForeignId;
  // ignore: non_constant_identifier_names
  String? ForeignTableName;
  // ignore: non_constant_identifier_names
  DateTime? RecordDate;

  DTOPhoto({
    // ignore: non_constant_identifier_names
    this.Id,
    // ignore: non_constant_identifier_names
    this.Name,
    // ignore: non_constant_identifier_names
    this.Extension,
    // ignore: non_constant_identifier_names
    this.Path,
    // ignore: non_constant_identifier_names
    this.SubPath,
    // ignore: non_constant_identifier_names
    this.ForeignId,
    // ignore: non_constant_identifier_names
    this.ForeignTableName,
    // ignore: non_constant_identifier_names
    this.RecordDate,
  });

  factory DTOPhoto.fromJson(Map<String, dynamic> json) {
    return _$DTOPhotoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOPhotoToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOPhotoFromJson(json);
  }
}
