import 'package:firebase_database/firebase_database.dart';

class CardDataService {
  CardDataService() {
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
}
