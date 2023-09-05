import 'package:e_commerce_app/core/utils/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.inputType,
      this.suffexIcon,
      this.onSaved,
      this.onChanged,
      this.maxLines,
      this.hintText,
      this.color,
      required this.labelText,
      this.controller,
      this.icon,
      required this.readOnly,
      this.isPasswordFiled = false,
      this.onTap,
      this.validator,
      this.initialValue})
      : super(key: key);
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final String? hintText;
  final String labelText;
  final Color? color;
  final bool readOnly;
  final Function()? onTap;
  final String? initialValue;
  final IconData? icon;
  final bool isPasswordFiled;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: TextStyle(fontSize: 14, color: ColorManager.dark),
      readOnly: readOnly,
      controller: controller,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
          contentPadding: REdgeInsetsDirectional.only(
              top: 10, start: 20, end: 20, bottom: 10),
          // hintStyle: TextStyle(color: ColorManager.primary,),
          labelText: labelText,
          // hintStyle: TextStyle(color: ColorManager.dark),
          labelStyle: TextStyle(color: ColorManager.hint, fontSize: 16),
          suffixIcon: suffexIcon,
          prefixIcon: Icon(
            icon,
            color: ColorManager.primary,
            size: 30,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.w),
              borderSide: BorderSide(color: Colors.grey.shade400)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.w),
              borderSide: BorderSide(color: ColorManager.mainGrey)),
          hintText: hintText,
          filled: true,
          fillColor: ColorManager.mainGrey,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(color: ColorManager.mainGrey))),
    );
  }

  // Widget eyeIcon(bool obscure) {
  //   return IconButton(
  //     onPressed: () => obscureNotifier.value = !obscure,
  //     icon: Icon(obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
  //         color: context.colorScheme.primary),
  //   );
  // }
}
// flutter native
