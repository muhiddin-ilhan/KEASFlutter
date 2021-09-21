import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'DTOResult.g.dart';

@JsonSerializable()
class DTOResult extends BaseModel<DTOResult> {
  // ignore: non_constant_identifier_names
  bool? IsSuccess;
  // ignore: non_constant_identifier_names
  String? ResultMessage;

  // ignore: non_constant_identifier_names
  DTOResult({this.IsSuccess, this.ResultMessage,});

  factory DTOResult.fromJson(Map<String, dynamic> json) {
    return _$DTOResultFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DTOResultToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$DTOResultFromJson(json);
  }
}
