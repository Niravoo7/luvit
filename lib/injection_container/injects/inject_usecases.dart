import 'package:get/get.dart';
import 'package:luvit/feature/home/domain/usecases/get_card_data.dart';
import 'package:luvit/injection_container/injection_container_imports.dart';

class InjectableUseCases {
  InjectableUseCases.inject() {
    Get.lazyPut<GetCardUC>(
      () => GetCardUC(homeRepository: Get.find()),
      fenix: true,
    );
  }
}
