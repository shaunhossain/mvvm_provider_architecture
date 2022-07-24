import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/base_viewmodel.dart';
import 'package:mvvm_provider_architecture/locator.dart';
import 'package:provider/provider.dart';

class BaseView <T extends BaseViewModel> extends StatelessWidget {
  const BaseView({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context , T model,Widget? child ) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => locator<T>(),
        child: Consumer<T>(builder: builder));
  }
}
