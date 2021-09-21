import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingResponseGeometry.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingResponseProperties.dart';

part 'BMSRoutingResponseFeatures.g.dart';

@JsonSerializable()
class BMSRoutingResponseFeatures extends BaseModel<BMSRoutingResponseFeatures> {
  String? type;
  BMSRoutingResponseProperties? properties;
  BMSRoutingResponseGeometry? geometry;

  BMSRoutingResponseFeatures({this.type, this.properties, this.geometry});

  factory BMSRoutingResponseFeatures.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseFeaturesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingResponseFeaturesToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseFeaturesFromJson(json);
  }
}
