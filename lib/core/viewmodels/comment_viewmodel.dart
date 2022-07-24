import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/models/comment.dart';
import 'package:mvvm_provider_architecture/core/services/api.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/base_viewmodel.dart';
import 'package:mvvm_provider_architecture/locator.dart';

class CommentViewModel extends BaseViewModel{
  final Api _api = locator<Api>();
  List<Comment>? comments;

  Future fetchComment(int postId) async{
    setState(ViewState.busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.idle);
  }
}