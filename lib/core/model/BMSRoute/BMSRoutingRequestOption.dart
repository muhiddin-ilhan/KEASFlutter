import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';

part 'BMSRoutingRequestOption.g.dart';

@JsonSerializable()
class BMSRoutingRequestOption extends BaseModel<BMSRoutingRequestOption> {
  bool? liveTraffic;
  bool? alternativeRoute;
  int? alternativeCount;
  int? snapMaxDistance;
  int? costType;
  bool? isCar;
  bool? isTruck;
  bool? isPedestrian;
  bool? avoidToolRoad;
  bool? avoidHighway;
  bool? useFerry;
  bool? avoidPrivateRoad;
  bool? avoidRestrictedRoad;
  bool? useBoat;
  bool? isBus;
  bool? getManifest;

  BMSRoutingRequestOption({
    this.liveTraffic,
    this.alternativeRoute,
    this.alternativeCount,
    this.snapMaxDistance,
    this.costType,
    this.isCar,
    this.isTruck,
    this.isPedestrian,
    this.avoidToolRoad,
    this.avoidHighway,
    this.useFerry,
    this.avoidPrivateRoad,
    this.avoidRestrictedRoad,
    this.useBoat,
    this.isBus,
    this.getManifest,
  });

  factory BMSRoutingRequestOption.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingRequestOptionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingRequestOptionToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingRequestOptionFromJson(json);
  }
}
