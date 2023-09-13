import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets_manager.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(25, 10, 25, 5),
      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 10, color: Colors.white),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5)),
                ],
              ),
              child: Image.asset(
                ImageAssets.profile,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ).animate().scaleXY(delay: const Duration(milliseconds: 100))),
          20.verticalSpace,
        ],
      ),
    );
  }
}
