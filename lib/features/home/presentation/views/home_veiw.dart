import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/widgets/home_view_body.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetNewsDataError) {
            return Center(child: Text(state.error));
          } else if (state is GetNewsDataLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          }
          return HomeViewBody(newsModel: context.read<HomeCubit>().newsList);
        },
      ),
    );
  }
}
