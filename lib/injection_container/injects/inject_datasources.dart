import 'package:get/get.dart';
import 'package:luvit/feature/home/data/datasources/home_remote_datasource.dart';

class InjectableDataSources {
  InjectableDataSources.inject() {
    Get.lazyPut<HomeRemoteDataSource>(
      HomeRemoteDataSourceImpl.new,
      fenix: true,
    );
  }
}
