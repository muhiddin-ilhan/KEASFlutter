import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'BMSRoutingResponseProperties.g.dart';

@JsonSerializable()
class BMSRoutingResponseProperties extends BaseModel<BMSRoutingResponseProperties> {
  int? fromNodeId;
  int? toNodeId;
  int? basarId;
  int? fc;
  int? df;
  double? distance;
  double? duration;
  int? averageSpeed;
  double? averageTrafficSpeed;
  int? speedLimit;
  String? typeName;
  String? constructionName;
  dynamic adjacentEdges;
  String? name;

  BMSRoutingResponseProperties({
    this.fromNodeId,
    this.toNodeId,
    this.basarId,
    this.fc,
    this.df,
    this.distance,
    this.duration,
    this.averageSpeed,
    this.averageTrafficSpeed,
    this.speedLimit,
    this.typeName,
    this.constructionName,
    this.adjacentEdges,
    this.name,
  });

  factory BMSRoutingResponseProperties.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponsePropertiesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingResponsePropertiesToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponsePropertiesFromJson(json);
  }
}
