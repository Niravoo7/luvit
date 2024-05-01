import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/feature/chat/presentation/chat_page.dart';
import 'package:luvit/feature/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:luvit/feature/home/presentation/pages/home_page.dart';
import 'package:luvit/feature/profile/presentation/profile_page.dart';
import 'package:luvit/feature/spot/presentation/spot_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final dashboardController = Get.find<DashboardController>();

  static final List<Widget> _selectedTab = <Widget>[
    const HomePage(),
    const SpotPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: dashboardController.tabIndex.value,
                  children: _selectedTab,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Theme(
        data: ThemeData(useMaterial3: false),
        child: Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            onPressed: () {
              //Get.toNamed(AppRoutes.addDream);
            },
            backgroundColor: Get.isDarkMode
                ? const Color(0xff333131)
                : ThemeColors.clrGrey50,
            child: Image.asset(
              IconConstants.icStar,
              height: 24,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          tabBuilder: (index, isActive) {
            return bottomItem(index: index, isActive: isActive);
          },
          splashRadius: 0,
          splashSpeedInMilliseconds: 0,
          activeIndex: dashboardController.tabIndex.value,
          backgroundColor:
              Get.isDarkMode ? ThemeColors.clrBlack : ThemeColors.clrWhite,
          height: 60,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) {
            dashboardController.tabIndex.value = index;
            dashboardController.tabIndex.refresh();
          },
          //other params
        ),
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconImage, required this.text});

  String iconImage;
  String text;
}

List<FABBottomAppBarItem> itemList = [
  FABBottomAppBarItem(
    iconImage: IconConstants.icHome,
    text: StringConstants.strHome,
  ),
  FABBottomAppBarItem(
    iconImage: IconConstants.icSpot,
    text: StringConstants.strSpot,
  ),
  FABBottomAppBarItem(
    iconImage: IconConstants.icChat,
    text: StringConstants.strChat,
  ),
  FABBottomAppBarItem(
    iconImage: IconConstants.icProfile,
    text: StringConstants.strProfile,
  ),
];

Widget bottomItem({
  required bool isActive,
  required int index,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        itemList[index].iconImage,
        height: 24,
        width: 24,
        color: isActive ? ThemeColors.tabSelectedColor : ThemeColors.clrGrey50,
      ),
      const SizedBox(
        height: 0,
      ),
      Text(
        itemList[index].text.tr,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color:
              isActive ? ThemeColors.tabSelectedColor : ThemeColors.clrGrey50,
        ),
      ),
    ],
  );
}
