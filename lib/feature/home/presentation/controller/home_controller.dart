import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/error/failure.dart';
import 'package:luvit/core/shared/domain/usecases/usecase.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';
import 'package:luvit/feature/home/domain/usecases/get_card_data.dart';

class HomeController extends GetxController {
  HomeController({required this.getCardUC});

  final GetCardUC getCardUC;

  RxList<CardData> cardDataList = <CardData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCardData();
  }

  Future<void> getCardData() async {
    final getCardFailedOrSuccess = await getCardUC(NoParams());
    getCardFailedOrSuccess.fold(
      (left) {
        var error = "";
        if (left is GeneralFailure) {
          error = left.error;
        }
        if (left is ServerFailure) {
          error = left.error;
        }
        debugPrint("Error $error");
        cardDataList.clear();
      },
      (right) {
        debugPrint("cardDataList 1 -> ${right.length}");
        cardDataList
          ..clear()
          ..bindStream(right);
        debugPrint("cardDataList -> ${cardDataList.length}");
      },
    );
  }
}
