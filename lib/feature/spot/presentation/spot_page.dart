import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/string_constants.dart';

class SpotPage extends StatelessWidget {
  const SpotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(StringConstants.strSpot.tr),
      ),
    );
  }
}
