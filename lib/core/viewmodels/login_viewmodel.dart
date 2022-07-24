import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/services/authentication_service.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/base_viewmodel.dart';
import 'package:mvvm_provider_architecture/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage = '';
  Future<bool> login({required String userIdText}) async {
    setState(ViewState.busy);
    var userId = int.tryParse(userIdText);
    log(userId.toString());
    if(userId == null){
      errorMessage = 'Value entered is not a number';
      setState(ViewState.idle);
      return false;
    }
    var response = await _authenticationService.login(userId);
    setState(ViewState.idle);
    return response;
  }

  void pushNextRoute(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }
}
