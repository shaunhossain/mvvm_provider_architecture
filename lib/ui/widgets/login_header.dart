import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/ui/shared/text_styles.dart';
import 'package:mvvm_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:mvvm_provider_architecture/ui/widgets/login_text_field.dart';


class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  const LoginHeader({Key? key, required this.controller, required this.validationMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium(),
      const Text('Enter a number between 1 - 10', style: subHeaderStyle),
      LoginTextField(controller: controller,),
      validationMessage != ''
          ? Text(validationMessage, style: const TextStyle(color: Colors.red))
          : Container()
    ]);
  }
}