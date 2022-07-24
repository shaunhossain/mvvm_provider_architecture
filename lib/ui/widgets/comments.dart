import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/comment_viewmodel.dart';
import 'package:mvvm_provider_architecture/ui/shared/app_colors.dart';
import 'package:mvvm_provider_architecture/ui/views/base_view.dart';
import 'package:mvvm_provider_architecture/ui/widgets/comment_item.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentViewModel>(
        onModelReady: (model) => model.fetchComment(postId),
        builder: (context, model, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: model.state == ViewState.busy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: model.comments!
                          .map((comment) => CommentItem(comment: comment))
                          .toList(),
                    ),
            ));
  }
}
