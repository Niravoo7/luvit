import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/core/library/story_app/lib/story_page_view.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';
import 'package:luvit/feature/home/presentation/controller/home_controller.dart';
import 'package:luvit/feature/home/presentation/widget/label_widget.dart';
import 'package:luvit/feature/home/presentation/widget/like_show_widget.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({
    required this.index,
    required this.cardData,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final int index;
  final CardData cardData;
  final CarouselController controller;

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    if (index == homeController.currentIndex.value) {
      homeController.onPlay();
      debugPrint("CarouselSliderWidget -> $index");
    }
    final user = cardData;
    return Scaffold(
      body: Stack(
        children: [
          if (user.images?.isEmpty ?? true)
            Container(
              decoration: BoxDecoration(
                color: ThemeColors.clrBlack,
                border: Border.all(color: ThemeColors.clrGrey50),
                borderRadius: BorderRadius.circular(20),
              ),
            )
          else
            Obx(
              () => StoryPageView(
                onTapArrowDown: () {
                  homeController.isDescriptionShow.value =
                      !homeController.isDescriptionShow.value;
                },
                isDescriptionShow: homeController.isDescriptionShow.value,
                itemBuilder: (context, pageIndex, storyIndex) {
                  final story = user.images![storyIndex];
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(color: Colors.black),
                      ),
                      Positioned.fill(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                            tileMode: TileMode.decal,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: story,
                            errorWidget: (context, url, error) {
                              return const SizedBox();
                            },
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: story,
                          errorWidget: (context, url, error) {
                            return const SizedBox();
                          },
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              ThemeColors.clrTransparent,
                              ThemeColors.clrTransparent,
                              ThemeColors.clrTransparent,
                              ThemeColors.clrTransparent,
                              ThemeColors.clrBlack.withOpacity(0.1),
                              ThemeColors.clrBlack.withOpacity(0.2),
                              ThemeColors.clrBlack.withOpacity(0.3),
                              ThemeColors.clrBlack.withOpacity(0.4),
                              ThemeColors.clrBlack.withOpacity(0.5),
                            ],
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                indicatorAnimationController:
                    homeController.indicatorAnimationController,
                initialStoryIndex: (pageIndex) {
                  if (pageIndex == 0) {
                    return 0;
                  }
                  return 0;
                },
                indicatorVisitedColor: ThemeColors.clrVividPink,
                pageLength: 1,
                storyLength: (pageIndex) {
                  return cardData.images!.length;
                },
                onPageLimitReached: () {
                  /*controller.nextPage(
                    duration: 300.milliseconds,
                    curve: Curves.easeIn,
                  );*/
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LikeShowWidget(like: user.likeCount ?? 0),
                          RichText(
                            text: TextSpan(
                              text: user.name ?? "",
                              style: const TextStyle(fontSize: 20),
                              children: [
                                TextSpan(
                                  text: ' ${user.age ?? ""}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              user.description ?? "",
                              style: TextStyle(
                                fontSize: 15,
                                color: ThemeColors.clrWhite.withOpacity(0.25),
                              ),
                            ),
                          ),
                          Obx(() {
                            if (homeController.isDescriptionShow.value) {
                              return LabelWidget(
                                labels: user.tags ?? [],
                              );
                            }
                            return const SizedBox();
                          }),
                        ],
                      ),
                    ),
                    Image.asset(
                      IconConstants.icLikes,
                      width: 48,
                      height: 48,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
