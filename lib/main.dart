import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/models/user.dart';
import 'package:mvvm_provider_architecture/core/services/authentication_service.dart';
import 'package:mvvm_provider_architecture/locator.dart';
import 'package:mvvm_provider_architecture/ui/router.dart';
import 'package:provider/provider.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>(
      initialData: User.initial(),
      create: (context) => locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/login',
        onGenerateRoute: PageRouter.generateRoute,
      ),
    );
  }
}