import 'package:get_it/get_it.dart';
import 'package:mvvm_provider_architecture/core/services/api.dart';
import 'package:mvvm_provider_architecture/core/services/authentication_service.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/comment_viewmodel.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/home_viewmodel.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/login_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => CommentViewModel());
  locator.registerFactory(() => HomeViewModel());
}