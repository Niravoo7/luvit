import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/local_db/get_storage_db.dart';
import 'package:luvit/core/services/api_client.dart';
import 'package:luvit/core/shared/presentation/controller/check_internet_controller.dart';
import 'package:luvit/feature/splash/presentation/controller/splash_controller.dart';
import 'package:luvit/firebase_options.dart';
import 'package:luvit/injection_container/injects/inject_controllers.dart';
import 'package:luvit/injection_container/injects/inject_datasources.dart';
import 'package:luvit/injection_container/injects/inject_repositories.dart';
import 'package:luvit/injection_container/injects/inject_usecases.dart';

Future<void> init() async {
  Get.lazyPut<SplashController>(SplashController.new, fenix: true);
  final localCache = LocalCache();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await localCache.getStorageInit();

  /// services
  Get
    ..put(ApiClient(), permanent: true)
    ..put<CheckInternetController>(CheckInternetController(), permanent: true)
    ..lazyPut<LocalCache>(() => localCache, fenix: true);

  /// Data Sources
  InjectableDataSources.inject();

  /// Repositories
  InjectableRepositories.inject();

  /// Use cases
  InjectableUseCases.inject();

  /// Controllers
  InjectableControllers.inject();
}
