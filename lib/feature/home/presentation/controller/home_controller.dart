import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';
import 'package:luvit/firebase/service/card_data_service.dart';

class HomeController extends GetxController {
  HomeController();

  RxList<CardData> cardDataList = <CardData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCardData();
  }

  Future<void> getCardData() async {
    CardDataService().getCardData().onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        cardDataList
          ..clear()
          ..addAll(parseMapFruitsToList(jsonEncode(data)))
          ..refresh();
      }
    });
  }
}
