import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/enums/view_state.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/login_viewmodel.dart';
import 'package:mvvm_provider_architecture/locator.dart';
import 'package:mvvm_provider_architecture/ui/shared/app_colors.dart';
import 'package:mvvm_provider_architecture/ui/shared/text_styles.dart';
import 'package:mvvm_provider_architecture/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => locator<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: const Text(
                'MVVM',
                style: appbarStyle,
              ),
              backgroundColor: backgroundColor,
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginHeader(
                    controller: _controller, validationMessage: 'nothing'),
                model.state == ViewState.busy
                    ? const CircularProgressIndicator()
                    : MaterialButton(
                        minWidth: 200,
                        height: 50,
                        color: Colors.grey.shade100,
                        shape: const StadiumBorder(),
                        child: const Text("login"),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(userIdText: _controller.text);
                          if (loginSuccess) {
                            log(loginSuccess.toString());
                          }
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
