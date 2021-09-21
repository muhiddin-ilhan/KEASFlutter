import 'package:dio/dio.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/base/model/base_model.dart';
import 'package:nestle_app/core/constants/base_settings.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    if (_instance == null) {
      _instance = NetworkManager._init();
    }
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: BaseSettings.BASE_API_URL);
    _dio = Dio(baseOptions);
  }

  setBmsRoutingUrl() {
    _dio!.options.baseUrl = BaseSettings.BASE_ROUTING_URL;
  }

  setBaseApiUrl() {
    _dio!.options.baseUrl = BaseSettings.BASE_API_URL;
  }

  setHeader() {
    Map<String, dynamic> headers = Map<String, dynamic>();

    if (AppSession.instance!.getUser() != null) {
      if (AppSession.instance!.getUser()!.Token != null) {
        headers["Token"] = AppSession.instance!.getUser()!.Token;
      }

      if (AppSession.instance!.getUser()!.Email != null) {
        headers["Identity"] = AppSession.instance!.getUser()!.Email;
      }

      _dio!.options.headers = headers;
    }
  }

  Dio? _dio;

  Future dioPost<T extends BaseModel<T>>(String path, T model, dynamic data) async {
    try {
      final response = await _dio!.post(path, data: data);
      if (response.statusCode == 200) {
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, dynamic>) {
          return model.fromJson(responseBody);
        }
        return responseBody;
      }
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
  }
}
