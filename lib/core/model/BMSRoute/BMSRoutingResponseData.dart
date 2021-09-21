import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingResponseFeatures.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingResponseProperties.dart';

part 'BMSRoutingResponseData.g.dart';

@JsonSerializable()
class BMSRoutingResponseData extends BaseModel<BMSRoutingResponseData> {
  String? type;
  BMSRoutingResponseProperties? properties;
  List<BMSRoutingResponseFeatures>? features;

  BMSRoutingResponseData({this.type, this.properties, this.features});

  factory BMSRoutingResponseData.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingResponseDataToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseDataFromJson(json);
  }
}
