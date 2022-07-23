import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/locator.dart';
import 'package:mvvm_provider_architecture/ui/views/login_view.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: LoginView(),
    );
  }
}