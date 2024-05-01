import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';

abstract class HomeRemoteDataSource {
  Stream<List<CardDataModel>> getCardList();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl() {
    _fd.setPersistenceEnabled(true);
  }

  final _fd = FirebaseDatabase.instance;
  final _coll = 'data';

  String getCardUrl() {
    return _coll;
  }

  DatabaseReference getCardData() {
    return FirebaseDatabase.instance.ref(getCardUrl());
  }

  @override
  Stream<List<CardDataModel>> getCardList() {
    /*return getCardData().onValue.map((event) {
      if (event.snapshot.value != null) {
        final Map<String, dynamic> data = event.snapshot.value;
        return data.entries
            .map((entry) => CardDataModel.fromJson(entry.value))
            .toList();
      } else {
        return <CardDataModel>[];
      }
    });*/

    return FirebaseDatabase.instance.ref().onValue.map(
      (event) {
        final cardModels = <CardDataModel>[];
        for (var i = 0; i < event.snapshot.children.toList().length; i++) {
          cardModels.addAll(
            parseMapFruitsToList(
              jsonEncode(event.snapshot.children.toList()[i].value),
            ),
          );
        }
        debugPrint("getCardList -> ${cardModels.length}");
        return cardModels;
      },
    );
  }
}
