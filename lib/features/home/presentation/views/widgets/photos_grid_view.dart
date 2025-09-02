import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/features/home/data/models/photos_model.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';

class PhotosGridView extends StatefulWidget {
  const PhotosGridView({super.key, required this.id});
  final int id;
  @override
  State<PhotosGridView> createState() => _PhotosGridViewState();
}

class _PhotosGridViewState extends State<PhotosGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetPhotosDataSuccess) {
          homeCubit.photosModel = state.photosModel;
        }
        if (state is ChangePhotoSuccess) {
          homeCubit.photoIndex = state.index;
        }
      },
      buildWhen: (previous, current) =>
          current is GetPhotosDataSuccess ||
          current is GetPhotosDataError ||
          current is GetPhotosDataLoading ||
          current is ChangePhotoSuccess,

      builder: (context, state) {
        if (state is GetPhotosDataError) {
          return Center(child: Text(state.error));
        } else if (state is GetPhotosDataLoading) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<HomeCubit>().changePhotoIndex(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: homeCubit.photoIndex == index
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      fit: BoxFit.fill,
                      homeCubit.photosModel?.profiles[index].filePath ?? "",
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: homeCubit.photosModel?.profiles.length ?? 0,
        );
      },
    );
  }
}
