import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/data/repo/auth_repository.dart';
import 'package:togg/data/repo/favorite_repository.dart';
import 'package:togg/data/repo/home_repository.dart';
import 'package:togg/page/favorite/favorite_vm.dart';
import 'package:togg/page/home/home_vm.dart';
import 'package:togg/page/login/login_vm.dart';

GetIt locator = GetIt.instance;
setupLocator() {
  locator.registerSingleton(() => ClientChannel(
      "http://flutterassessment.togg.cloud",
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure())));
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => FavoriteRepository());
  locator.registerLazySingleton(() => HomeRepository());

  locator.registerFactory(() => LoginViewModel(locator<AuthRepository>()));
  locator.registerFactory(() => HomeViewModel(locator<HomeRepository>()));
  locator
      .registerFactory(() => FavoriteViewModel(locator<FavoriteRepository>()));
}
