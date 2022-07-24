import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/base_viewmodel.dart';
import 'package:mvvm_provider_architecture/locator.dart';
import 'package:provider/provider.dart';

class BaseView <T extends BaseViewModel> extends StatefulWidget {
  const BaseView({Key? key, required this.builder,this.onModelReady}) : super(key: key);
  final Function(T) ? onModelReady;

  final Widget Function(BuildContext context , T model,Widget? child ) builder;

  @override
  State<BaseView <T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {

  T model = locator<T>();

  @override
  void initState() {
    if(widget.onModelReady != null){
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
