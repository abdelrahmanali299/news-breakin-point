import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_details_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/photos_model.dart';
import 'package:news_app_breakin_point/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  NewsModel? newsList;
  PhotosModel? photosModel;
  int photoIndex = 0;
  getNewsData() async {
    emit(GetNewsDataLoading());
    var res = await homeRepo.getNewsData();
    res.fold((failure) => emit(GetNewsDataError(failure)), (newsModel) {
      emit(GetNewsDataSuccess(newsModel));
      newsList = newsModel;
    });
  }

  getNewsDetailsData(int id) async {
    emit(GetNewsDetailsDataLoading());
    var res = await homeRepo.getNewsDetailsData(id);
    res.fold(
      (failure) => emit(GetNewsDetailsDataError(failure)),
      (newsDetailsModel) => emit(GetNewsDetailsDataSuccess(newsDetailsModel)),
    );
  }

  getPhotosData(int id) async {
    emit(GetPhotosDataLoading());
    var res = await homeRepo.getPhotosData(id);

    res.fold((failure) => emit(GetPhotosDataError(failure)), (photosModel) {
      emit(GetPhotosDataSuccess(photosModel));
    });
  }

  changePhotoIndex(int index) {
    emit(ChangePhotoSuccess(index));
  }
}
