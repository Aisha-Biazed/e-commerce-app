import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/utils/color_manger.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    this.text,
    this.onTap,
    this.icon,
    this.color,
    this.fontSize,
    this.height,
  }) : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final double? fontSize;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.w),
          // border: Border.all(color: colorBorder!, width: 1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorManager.white,
              size: 20,
            ),
            3.horizontalSpace,
            CustomText(
              fontWeight: FontWeight.w500,
              txtColor: ColorManager.white,
              fontSize: fontSize,
              txt: text!,
              textAlign: TextAlign.center,
            ),
            3.horizontalSpace
          ],
        ),
      ),
    );
  }
}
