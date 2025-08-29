import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_breakin_point/core/api/api_services.dart';
import 'package:news_app_breakin_point/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app_breakin_point/features/home/presentation/manager/cubits/home_cubit.dart';
import 'package:news_app_breakin_point/features/home/presentation/views/home_veiw.dart';

void main() {
  ApiServices.init();
  runApp(News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())..getNewsData(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeVeiw()),
    );
  }
}
