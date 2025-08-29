import 'package:dio/dio.dart';
import 'package:news_app_breakin_point/core/api/end_points.dart';
import 'package:news_app_breakin_point/core/functions/handle_dio_exception.dart';


class ApiServices {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  }

  static Future<dynamic> get({required String path}) async {
    try {
      var res = await dio.get(path);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  static Future<dynamic> post({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      var res = await dio.post(path, data: body);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  static Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(path, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
