import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/feature/home/presentation/widget/carousel_slider_widget.dart';
import 'package:luvit/feature/home/presentation/controller/home_controller.dart';
import 'package:luvit/feature/home/presentation/widget/no_story_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.cardDataList.isEmpty) {
        return const NoStoryWidget();
      }
      return storyCardUi();
    });
  }

  Widget storyCardUi() {
    return const Center(child: CarouselSliderWidget());
  }
}
