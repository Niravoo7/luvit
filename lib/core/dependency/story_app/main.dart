import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/dependency/story_app/lib/story_page_view.dart';
import 'package:luvit/core/dependency/story_app/page_story.dart';
import 'package:luvit/feature/home/presentation/controller/home_controller.dart';

class CarouselSliderExample extends StatefulWidget {
  const CarouselSliderExample({super.key});

  @override
  _CarouselSliderExampleState createState() => _CarouselSliderExampleState();
}

class _CarouselSliderExampleState extends State<CarouselSliderExample> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  // List<LoanModel> items = [
  //   LoanModel(
  //     title: 'Slide 1',
  //     color: Colors.transparent,
  //     userModel: UserModel([
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //     ], "User1",
  //         "https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //   ),
  //   LoanModel(
  //     title: 'Slide 2',
  //     color: Colors.transparent,
  //     userModel: UserModel([
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //     ], "User2",
  //         "https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //   ),
  //   LoanModel(
  //     title: 'Slide 3',
  //     color: Colors.transparent,
  //     userModel: UserModel([
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //       StoryModel(
  //           "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //     ], "User3",
  //         "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  //   ),
  // ];

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
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) async {
                  // items[index].userModel.late =
                  //     ValueNotifier<IndicatorAnimationCommand>(
                  //         IndicatorAnimationCommand.resume);
                  // loanModel.value = items[index];
                  // setState(() {});
                },
                enableInfiniteScroll: false,
              ),
              itemCount: homeController.cardDataList.length,
              itemBuilder: (context, index, realIndex) {
                final item = homeController.cardDataList[index];
                return Dismissible(
                  key: UniqueKey() ?? Key(index.toString()),
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
