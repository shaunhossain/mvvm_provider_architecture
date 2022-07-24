import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/models/post.dart';
import 'package:mvvm_provider_architecture/core/models/user.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/home_viewmodel.dart';
import 'package:mvvm_provider_architecture/ui/shared/app_colors.dart';
import 'package:mvvm_provider_architecture/ui/shared/text_styles.dart';
import 'package:mvvm_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:mvvm_provider_architecture/ui/views/base_view.dart';
import 'package:mvvm_provider_architecture/ui/widgets/post_list_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Post',
            style: appbarStyle,
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: model.state == ViewState.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceMedium(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.horizontalSpaceSmall(),
                  Expanded(
                    child: getPostsUi(context, model.posts),
                  )
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(BuildContext context, List<Post>? posts) =>
      ListView.builder(
        itemCount: posts!.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, '/post', arguments: posts[index]);
          },
        ),
      );
}
