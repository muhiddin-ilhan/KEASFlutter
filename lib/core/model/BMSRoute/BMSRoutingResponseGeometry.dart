import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'BMSRoutingResponseGeometry.g.dart';

@JsonSerializable()
class BMSRoutingResponseGeometry extends BaseModel<BMSRoutingResponseGeometry> {
  String? type;
  List<List<double>>? coordinates;

  BMSRoutingResponseGeometry({this.type, this.coordinates});

  factory BMSRoutingResponseGeometry.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseGeometryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingResponseGeometryToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseGeometryFromJson(json);
  }
}
