import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/models/comment.dart';
import 'package:mvvm_provider_architecture/ui/shared/app_colors.dart';
import 'package:mvvm_provider_architecture/ui/shared/ui_helpers.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({ Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}