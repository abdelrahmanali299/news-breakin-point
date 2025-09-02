import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_model.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/news_details_view.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/widgets/news_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, this.newsModel});
  final NewsModel? newsModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            final homeCubit = context.read<HomeCubit>();
            final id = newsModel?.results[index].id ?? 0;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewsDetailsView();
                },
              ),
            );
            homeCubit.getNewsDetailsData(id);
          },
          child: NewsItem(result: newsModel?.results[index]),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 20);
      },
      itemCount: newsModel?.results.length ?? 0,
    );
  }
}
