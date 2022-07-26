import 'package:flutter/material.dart';
import 'package:mvvm_provider_architecture/core/models/post.dart';
import 'package:mvvm_provider_architecture/ui/shared/text_styles.dart';
import 'package:mvvm_provider_architecture/ui/views/home_view.dart';
import 'package:mvvm_provider_architecture/ui/views/login_view.dart';
import 'package:mvvm_provider_architecture/ui/views/post_view.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());

      case '/post':
        final post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                      'No route found ${settings.name}',
                      style: subHeaderStyle,
                    ),
                  ),
                ));
    }
  }
}
