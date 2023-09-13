import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/color_manger.dart';

AppBar CustomAppBar({
  required Widget textFiled,
  required void Function()? onPressed,
}) =>
    AppBar(
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      toolbarHeight: 120.h,
      backgroundColor: ColorManager.white,
      title: Column(
        children: [
          Row(
            children: [
              CustomText(
                txt: AppStrings.e,
                txtColor: ColorManager.dark,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                txt: AppStrings.commerce,
                txtColor: ColorManager.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
              const Spacer(),
              IconButton(
                  onPressed: onPressed,
                  icon: Image.asset(
                    ImageAssets.cart,
                    height: 27,
                    width: 27,
                  ))
            ],
          ).animate(onComplete: (c) => c.repeat()).shimmer(
              delay: const Duration(milliseconds: 4000),
              duration: const Duration(milliseconds: 2500)),
          Padding(
            padding: REdgeInsetsDirectional.only(start: 30, end: 44),
            child: Container(
              width: 293.w,
              height: 47.h,
              decoration: BoxDecoration(
                  color: ColorManager.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(23)),
              child: textFiled,
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(30))),
    );
