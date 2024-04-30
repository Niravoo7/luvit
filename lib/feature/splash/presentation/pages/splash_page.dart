import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/feature/splash/presentation/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = Get.find<SplashController>();

  @override
  void initState() {
    super.initState();
    splashController.initialNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 155,
            width: 155,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(ImageConstants.imgAppIcon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
