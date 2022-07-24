import 'package:mvvm_provider_architecture/core/services/api.dart';
import 'package:mvvm_provider_architecture/locator.dart';

class AuthenticationService{
  final Api _api = locator<Api>();
  Future<bool> login(int userId) async {
    var fetchUserInfo = await _api.getUserProfile(userId: userId);
    var hasUser = fetchUserInfo != null;
    return hasUser;
  }
}
