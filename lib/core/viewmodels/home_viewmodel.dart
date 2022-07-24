import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/models/post.dart';
import 'package:mvvm_provider_architecture/core/services/api.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/base_viewmodel.dart';
import 'package:mvvm_provider_architecture/locator.dart';

class HomeViewModel extends BaseViewModel {
  final Api _api = locator<Api>();
  List<Post>? posts;

  Future getPosts(int userId) async {
    setState(ViewState.busy);
    posts = await _api.getPostsForUser(userId: userId);
    setState(ViewState.idle);
  }
}
