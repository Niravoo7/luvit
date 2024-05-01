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
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Get.isDarkMode ? const Color(0xff333131) : ThemeColors.clrGrey50,
        elevation: 0,
        onPressed: () => debugPrint("Add Button pressed"),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
            color: Get.isDarkMode ? ThemeColors.clrBlack : ThemeColors.clrWhite,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          IconConstants.icStar,
          height: 24,
          color: Get.isDarkMode ? ThemeColors.clrBlack : ThemeColors.clrWhite,
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(useMaterial3: false),
        child: BottomAppBar(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Get.isDarkMode
                    ? ThemeColors.clrBlack
                    : ThemeColors.clrWhite,
              ),
              child: Obx(
                () => Row(
                  children: List.generate(
                    itemList.length,
                    (index) => navItem(
                      itemList[index].iconImage,
                      dashboardController.tabIndex.value == index,
                      text: itemList[index].text,
                      onTap: () => onTap(index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTap(int index) async {
    dashboardController.tabIndex.value = index;
  }

  Widget navItem(
    String icon,
    bool selected, {
    required String text,
    Function()? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 24,
              width: 24,
              color: selected
                  ? ThemeColors.tabSelectedColor
                  : ThemeColors.clrGrey50,
            ),
            const SizedBox(
              height: 0,
            ),
            Text(
              text.tr,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: selected
                    ? ThemeColors.tabSelectedColor
                    : ThemeColors.clrGrey50,
              ),
            ),
          ],
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
