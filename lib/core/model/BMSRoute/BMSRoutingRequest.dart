import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingRequestOption.dart';

part 'BMSRoutingRequest.g.dart';

@JsonSerializable()
class BMSRoutingRequest extends BaseModel<BMSRoutingRequest> {
  String? origin;

  String? destination;

  String? wayPoints;

  bool? addRestDuration;

  int? restDuration;

  BMSRoutingRequestOption? requestOptions;

  BMSRoutingRequest({this.origin, this.destination, this.wayPoints, this.addRestDuration, this.restDuration, this.requestOptions});

  factory BMSRoutingRequest.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingRequestToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingRequestFromJson(json);
  }
}
