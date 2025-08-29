import 'package:dartz/dartz.dart';
import 'package:news_app_breakin_point/core/api/api_services.dart';
import 'package:news_app_breakin_point/core/api/end_points.dart';
import 'package:news_app_breakin_point/core/error/exception.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_details_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/photos_model.dart';
import 'package:news_app_breakin_point/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<String, NewsModel>> getNewsData() async {
    try {
      var res = await ApiServices.get(path: EndPoints.news);
      NewsModel newsModel = NewsModel.fromJson(res);
      return right(newsModel);
    } on ServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, NewsDetailsModel>> getNewsDetailsData(int id) async {
    try {
      var res = await ApiServices.get(
        path: '/3/person/$id?api_key=${ApiConstants.apiKey}',
      );
      NewsDetailsModel newsDetailsModel = NewsDetailsModel.fromJson(res);
      return right(newsDetailsModel);
    } on ServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, PhotosModel>> getPhotosData(int id) async {
    try {
      var res = await ApiServices.get(
        path: '/3/person/$id/images?api_key=${ApiConstants.apiKey}',
      );
      PhotosModel photosModel = PhotosModel.fromJson(res);
      // print('Photo model  ${photosModel.toJson()}');
      return right(photosModel);
    } on ServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
