import 'package:dio/dio.dart';
import 'package:news_app_breakin_point/core/error/exception.dart';

handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.sendTimeout:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.receiveTimeout:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.badCertificate:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.cancel:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.connectionError:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.unknown:
      throw ServerException(message: e.response!.statusMessage.toString());

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerException(message: e.response!.statusMessage.toString());
        case 401:
          throw ServerException(message: e.response!.statusMessage.toString());
        case 403:
          throw ServerException(message: e.response!.statusMessage.toString());
        case 404:
          throw ServerException(message: e.response!.statusMessage.toString());
        case 409:
          throw ServerException(message: e.response!.statusMessage.toString());
        case 500:
          throw ServerException(message: e.response!.statusMessage.toString());
        default:
          throw ServerException(message: e.response!.statusMessage.toString());
      }
  }
}
