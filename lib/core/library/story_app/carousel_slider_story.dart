import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/library/story_app/lib/story_page_view.dart';
import 'package:luvit/core/library/story_app/page_story.dart';
import 'package:luvit/feature/home/presentation/controller/home_controller.dart';

class CarouselSliderStory extends StatefulWidget {
  const CarouselSliderStory({super.key});

  @override
  _CarouselSliderStoryState createState() => _CarouselSliderStoryState();
}

class _CarouselSliderStoryState extends State<CarouselSliderStory> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand.resume,
    );
  }

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homeController.cardDataList.isNotEmpty
          ? CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) async {},
                enableInfiniteScroll: false,
              ),
              itemCount: homeController.cardDataList.length,
              itemBuilder: (context, index, realIndex) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.down,
                  onDismissed: (direction) {
                    homeController.cardDataList.removeAt(index);
                    setState(() {});
                  },
                  background: Container(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: item.color,
                    ),
                    child: StoryPage(
                      controller: controller,
                      cardData: homeController.cardDataList[index],
                    ),
                  ),
                );
              },
            )
          : const SizedBox();
    });
  }
}
