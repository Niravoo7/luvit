import 'package:get/get.dart';
import 'package:luvit/feature/home/data/repositories/home_repository_impl.dart';
import 'package:luvit/feature/home/domain/repositories/home_repository.dart';

class InjectableRepositories {
  InjectableRepositories.inject() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: Get.find()),
      fenix: true,
    );
  }
}
