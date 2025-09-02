import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app_breakin_point/features/home/data/models/news_details_model.dart';

class BiographBody extends StatefulWidget {
  const BiographBody({super.key, required this.newsDetailsModel});
  final NewsDetailsModel newsDetailsModel;
  @override
  State<BiographBody> createState() => _BiographBodyState();
}

class _BiographBodyState extends State<BiographBody> {
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.newsDetailsModel.biography.length > 300
            ? !isReadMore
                  ? widget.newsDetailsModel.biography
                  : '${widget.newsDetailsModel.biography.substring(0, 300)}...'
            : widget.newsDetailsModel.biography,
        style: TextStyle(color: Colors.grey, height: 1.5),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isReadMore = !isReadMore;
                });
              },
            text: widget.newsDetailsModel.biography.length > 300
                ? isReadMore
                      ? 'Read More'
                      : 'Read Less'
                : null,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
