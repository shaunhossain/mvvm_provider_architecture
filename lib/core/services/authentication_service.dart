import 'dart:async';

import 'package:mvvm_provider_architecture/core/models/user.dart';
import 'package:mvvm_provider_architecture/core/services/api.dart';
import 'package:mvvm_provider_architecture/locator.dart';

class AuthenticationService {
  StreamController<User> userController = StreamController<User>();
  final Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    var fetchUserInfo = await _api.getUserProfile(userId: userId);
    var hasUser = fetchUserInfo != null;
    if (hasUser) {
      userController.add(fetchUserInfo);
    }
    return hasUser;
  }
}
