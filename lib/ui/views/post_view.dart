import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/models/post.dart';
import 'package:mvvm_provider_architecture/core/models/user.dart';
import 'package:mvvm_provider_architecture/ui/shared/app_colors.dart';
import 'package:mvvm_provider_architecture/ui/shared/text_styles.dart';
import 'package:mvvm_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:mvvm_provider_architecture/ui/widgets/comments.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Text(post.title,style: headerStyle,),
            Text('by ${Provider.of<User>(context).name}'),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            UIHelper.horizontalSpaceSmall(),
            Expanded(child: Comments(postId: post.userId)),
          ],
        ),
      ),
    );
  }
}
