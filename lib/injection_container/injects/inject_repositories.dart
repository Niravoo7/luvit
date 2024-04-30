import 'package:get/get.dart';
import 'package:luvit/injection_container/injection_container_imports.dart';

class InjectableRepositories {
  InjectableRepositories.inject() {
    /*Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: Get.find()),
      fenix: true,
    );*/
  }
}
