import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/widgets/details_body.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text('Details Screen', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is GetNewsDetailsDataSuccess ||
            current is GetNewsDetailsDataError ||
            current is GetNewsDetailsDataLoading,
        builder: (context, state) {
          if (state is GetNewsDetailsDataError) {
            return Center(child: Text(state.error));
          } else if (state is GetNewsDetailsDataSuccess) {
            return DetailsBody(newsDetailsModel: state.newsDetailsModel);
          }
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        },
      ),
    );
  }
}
