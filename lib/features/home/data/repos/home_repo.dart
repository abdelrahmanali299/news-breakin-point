import 'package:dartz/dartz.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_details_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/photos_model.dart';

abstract class HomeRepo 
{
  Future<Either<String,NewsModel>> getNewsData();
  Future<Either<String,NewsDetailsModel>> getNewsDetailsData(int id);
  Future<Either<String,PhotosModel>> getPhotosData(int id);
}