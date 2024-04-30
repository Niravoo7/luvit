import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/shared/presentation/widget/common_widgets/custom_appbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: StringConstants.strDashboard.tr,
        isBackEnable: false,
      ),
      body: Center(
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
    );
  }
}
