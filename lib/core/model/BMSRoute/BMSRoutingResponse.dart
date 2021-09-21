import 'package:json_annotation/json_annotation.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingResponseData.dart';

part 'BMSRoutingResponse.g.dart';

@JsonSerializable()
class BMSRoutingResponse extends BaseModel<BMSRoutingResponse> {
  int? code;
  String? message;
  dynamic manifestData;
  List<BMSRoutingResponseData>? data;

  BMSRoutingResponse({this.code, this.message, this.manifestData, this.data});

  factory BMSRoutingResponse.fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BMSRoutingResponseToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BMSRoutingResponseFromJson(json);
  }
}
