import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';

abstract class HomeRemoteDataSource {
  Stream<List<CardModel>> getCardList();
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
  Stream<List<CardModel>> getCardList() {
    return FirebaseDatabase.instance.ref().onValue.map(
          (event) => event.snapshot.children
              .map((e) => CardModel.fromJson(e.value as Map<String, dynamic>))
              .toList(),
        );
  }
}
