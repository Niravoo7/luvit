import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            /*FirebaseDatabase.instance.ref('data').onValue.listen((event) {
              final data = event.snapshot.value;
              if (data != null) {
                final eventCameraModels =
                    parseMapFruitsToList(jsonEncode(data));
                for (var i = 0; i < eventCameraModels.length; i++) {
                  debugPrint("data -> $i -> ${eventCameraModels[i].toJson()}");
                }
              }
            });*/

            FirebaseDatabase.instance.ref('data').onValue.listen(
                  (event) =>
                      parseMapFruitsToList(jsonEncode(event.snapshot.value)),
                );
          },
          child: Container(
            color: ThemeColors.clrTransparent,
            child: Text(StringConstants.strHome.tr),
          ),
        ),
      ),
    );
  }
}
