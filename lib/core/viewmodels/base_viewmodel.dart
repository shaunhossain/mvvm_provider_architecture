import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/enums/view_state.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

}