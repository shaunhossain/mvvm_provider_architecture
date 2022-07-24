import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/services/authentication_service.dart';
import 'package:mvvm_provider_architecture/locator.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  Future<bool> login({required String userIdText}) async {
    setState(ViewState.busy);
    var userId = int.parse(userIdText);
    var response = await _authenticationService.login(userId);
    setState(ViewState.idle);
    return response;
  }

  void pushNextRoute(BuildContext context) {
    Navigator.pushNamed(context, '/post');
  }
}
