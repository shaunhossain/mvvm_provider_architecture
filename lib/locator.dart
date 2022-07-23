import 'package:get_it/get_it.dart';
import 'package:mvvm_provider_architecture/core/viewmodels/login_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginViewModel());
}