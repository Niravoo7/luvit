import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/feature/home/presentation/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
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
            //await homeController.getCardData();
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
