import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_details_model.dart';
import 'package:news_app_breakin_point/features/home/data/models/photos_model.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/widgets/biograph_body.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/widgets/photos_grid_view.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({super.key, required this.newsDetailsModel});
  final NewsDetailsModel newsDetailsModel;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  bool isReadMore = true;
  @override
  void initState() {
    context.read<HomeCubit>().getPhotosData(widget.newsDetailsModel.id);

    super.initState();
  }

  int index = 0;
  PhotosModel? photosModel;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is ChangePhotoSuccess) {
              index = state.index;
            } else if (state is GetPhotosDataSuccess) {
              photosModel = state.photosModel;
            }
          },
          buildWhen: (previous, current) => current is ChangePhotoSuccess,
          builder: (BuildContext context, HomeState state) {
            return AspectRatio(
              aspectRatio: 1.2,
              child: Image.network(
                photosModel?.profiles[index].filePath ??
                    widget.newsDetailsModel.profilePath,

                width: double.infinity,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                widget.newsDetailsModel.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                '${widget.newsDetailsModel.birthday.year}/${widget.newsDetailsModel.birthday.month}/${widget.newsDetailsModel.birthday.day}',
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                widget.newsDetailsModel.placeOfBirth,
                style: TextStyle(fontSize: 16),
              ),
              BiographBody(newsDetailsModel: widget.newsDetailsModel),
            ],
          ),
        ),
        PhotosGridView(id: widget.newsDetailsModel.id),
      ],
    );
  }
}
