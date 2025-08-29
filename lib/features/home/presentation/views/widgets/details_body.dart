import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_details_model.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    String filePath =
        context
            .read<HomeCubit>()
            .photoModel
            ?.profiles[context.watch<HomeCubit>().photoIndex]
            .filePath ??
        "";
    return ListView(
      children: [
        AspectRatio(
          aspectRatio: 1.2,
          child: Image.network(
            filePath,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
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
              RichText(
                text: TextSpan(
                  text: !isReadMore
                      ? widget.newsDetailsModel.biography
                      : '${widget.newsDetailsModel.biography.substring(0, 300)}...',
                  style: TextStyle(color: Colors.grey, height: 1.5),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isReadMore = !isReadMore;
                          });
                        },
                      text: isReadMore ? 'Read More' : 'Read Less',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        PhotosGridView(id: widget.newsDetailsModel.id),
      ],
    );
  }
}
