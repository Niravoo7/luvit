import 'package:get/get.dart';
import 'package:luvit/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:luvit/injection_container/injection_container_imports.dart';

class InjectableDataSources {
  InjectableDataSources.inject() {
    Get.lazyPut<HomeRemoteDataSource>(
      HomeRemoteDataSourceImpl.new,
      fenix: true,
    );
  }
}
