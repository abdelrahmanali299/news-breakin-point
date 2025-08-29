import 'package:flutter/material.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.result});
  final Result? result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .5,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(result?.profilePath ?? ""),
              ),
            ),
          ),
          Text(result?.name ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(result?.gender == 2 ? "male" : "female"),
              Text(result?.popularity.toString() ?? ""),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(result?.originalName ?? ""),
              Text(result?.adult == true ? "Adult" : "Not Adult"),
            ],
          ),
        ],
      ),
    );
  }
}
