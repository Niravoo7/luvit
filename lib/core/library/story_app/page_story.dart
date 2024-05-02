import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/core/library/story_app/lib/story_image.dart';
import 'package:luvit/core/library/story_app/lib/story_page_view.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';
import 'package:luvit/feature/home/presentation/widget/label_widget.dart';
import 'package:luvit/feature/home/presentation/widget/like_show_widget.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({
    required this.cardData,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final CardData cardData;
  final CarouselController controller;

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    onPlay();
  }

  Future<void> onPlay() async {
    if (indicatorAnimationController != null) {
      indicatorAnimationController!.value = IndicatorAnimationCommand.resume;
    } else {
      indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume,
      );
    }
  }

  RxBool isDescriptionShow = false.obs;

  @override
  Widget build(BuildContext context) {
    final user = widget.cardData;
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
                  isDescriptionShow.value = !isDescriptionShow.value;
                },
                isDescriptionShow: isDescriptionShow.value,
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
                          child: StoryImage(
                            key: ValueKey(story ?? ""),
                            imageProvider: NetworkImage(
                              story ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: StoryImage(
                          key: ValueKey(story ?? ""),
                          imageProvider: NetworkImage(
                            story ?? "",
                          ),
                          fit: BoxFit.fitWidth,
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
                indicatorAnimationController: indicatorAnimationController,
                initialStoryIndex: (pageIndex) {
                  if (pageIndex == 0) {
                    return 0;
                  }
                  return 0;
                },
                indicatorVisitedColor: ThemeColors.clrVividPink,
                pageLength: 1,
                storyLength: (pageIndex) {
                  return widget.cardData.images!.length;
                },
                onPageLimitReached: () {
                  // Navigator.pop(context);
                  widget.controller.nextPage(
                      duration: 300.milliseconds, curve: Curves.easeIn);
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
                            if (isDescriptionShow.value) {
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
          )
        ],
      ),
    );
  }
}
