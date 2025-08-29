part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetNewsDataLoading extends HomeState {}

class GetNewsDataSuccess extends HomeState {
  final NewsModel newsModel;
  GetNewsDataSuccess(this.newsModel);
}

class GetNewsDataError extends HomeState {
  final String error;
  GetNewsDataError(this.error);
}

class GetNewsDetailsDataLoading extends HomeState {}

class GetNewsDetailsDataError extends HomeState {
  final String error;
  GetNewsDetailsDataError(this.error);
}

class GetNewsDetailsDataSuccess extends HomeState {
  final NewsDetailsModel newsDetailsModel;
  GetNewsDetailsDataSuccess(this.newsDetailsModel);
}

class GetPhotosDataLoading extends HomeState {}

class GetPhotosDataError extends HomeState {
  final String error;
  GetPhotosDataError(this.error);
}

class GetPhotosDataSuccess extends HomeState {
  final PhotosModel photosModel;
  GetPhotosDataSuccess(this.photosModel);
}

class ChangePhotoSuccess extends HomeState {
  int index;
  ChangePhotoSuccess(this.index);
}
