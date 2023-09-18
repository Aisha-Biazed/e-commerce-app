// import 'package:e_commerce_app/core/utils/color_manger.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField(
//       {Key? key,
//       this.inputType,
//       this.suffexIcon,
//       this.onSaved,
//       this.onChanged,
//       this.maxLines,
//       this.hintText,
//       this.color,
//       required this.labelText,
//       required this.controller,
//       this.icon,
//       required this.readOnly,
//       this.isPasswordFiled = false,
//       this.onTap,
//       this.validator,
//       this.initialValue})
//       : super(key: key);
//   final TextInputType? inputType;
//   final TextEditingController controller;
//   final Widget? suffexIcon;
//   final ValueSetter? onSaved;
//   final ValueSetter? onChanged;
//   final int? maxLines;
//   final String? hintText;
//   final String labelText;
//   final Color? color;
//   final bool readOnly;
//   final Function()? onTap;
//   final String? initialValue;
//   final IconData? icon;
//   final bool isPasswordFiled;
//   final FormFieldValidator<String?>? validator;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       initialValue: initialValue,
//       style: TextStyle(fontSize: 14, color: ColorManager.dark),
//       readOnly: readOnly,
//       controller: controller,
//       keyboardType: inputType,
//       onChanged: onChanged,
//       onSaved: onSaved,
//       maxLines: maxLines,
//       onTap: onTap,
//       decoration: InputDecoration(
//           contentPadding: REdgeInsetsDirectional.only(
//               top: 10, start: 20, end: 20, bottom: 10),
//           // hintStyle: TextStyle(color: ColorManager.primary,),
//           labelText: labelText,
//           // hintStyle: TextStyle(color: ColorManager.dark),
//           labelStyle: TextStyle(color: ColorManager.grey, fontSize: 16),
//           suffixIcon: suffexIcon,
//           prefixIcon: Icon(
//             icon,
//             color: ColorManager.primary,
//             size: 30,
//           ),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15.w),
//               borderSide: BorderSide(color: Colors.grey.shade400)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15.w),
//               borderSide: BorderSide(color: ColorManager.grey)),
//           errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15.w),
//               borderSide: const BorderSide(color: Colors.red, width: 2.0)),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15.w),
//               borderSide: const BorderSide(color: Colors.red, width: 2.0)),
//           hintText: hintText,
//           filled: true,
//           fillColor: ColorManager.mainGrey,
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.w),
//               borderSide: BorderSide(color: ColorManager.mainGrey))),
//     );
//   }
//
//   // Widget eyeIcon(bool obscure) {
//   //   return IconButton(
//   //     onPressed: () => obscureNotifier.value = !obscure,
//   //     icon: Icon(obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
//   //         color: context.colorScheme.primary),
//   //   );
//   // }
// }
// // flutter native

import 'package:e_commerce_app/core/config/theme/typography.dart';
import 'package:e_commerce_app/core/utils/color_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField<T> extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      required this.name,
      this.controller,
      this.obscure = false,
      this.validator,
      this.prefixIcon,
      this.icon,
      this.hintTextStyle,
      this.textStyle,
      this.suffixIcon,
      this.suffix,
      this.hintText,
      this.labelText,
      this.borderSideColor,
      this.filled,
      this.fillColor,
      this.labelTextStyle,
      this.borderRadius,
      this.title,
      this.borderWidth,
      this.isPasswordFiled = false,
      this.readOnly = false,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String? labelText;
  final Color? borderSideColor;
  final Color? fillColor;
  final bool? filled;
  final TextStyle? labelTextStyle;
  final BorderRadius? borderRadius;
  final String? title;
  final double? borderWidth;
  final bool isPasswordFiled;
  final String name;
  final bool obscure;
  final bool readOnly;
  final keyboardType;
  final onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();

  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    obscureNotifier = ValueNotifier(widget.isPasswordFiled);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...{
          Text(
            widget.title!,
            style: context.textTheme.titleMedium.b,
          ),
          13.verticalSpace,
        },
        ValueListenableBuilder<bool>(
            valueListenable: obscureNotifier,
            builder: (context, obscureValue, _) {
              return FormBuilderTextField(
                keyboardType: widget.keyboardType,
                readOnly: widget.readOnly,
                name: widget.name,
                controller: widget.controller,
                obscureText: obscureValue,
                validator: widget.validator,
                onChanged: widget.onChanged,
                style: widget.textStyle ??
                    context.textTheme.titleSmall?.r?.copyWith(
                        color: ColorManager.dark,
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? ColorManager.secondaryGrey,
                      width: widget.borderWidth ?? 0.5,
                    ),
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(15.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderSideColor ?? ColorManager.mainGrey,
                      width: widget.borderWidth ?? 0.5,
                    ),
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(15.w),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.w),
                      borderSide:
                          BorderSide(color: ColorManager.primary, width: 0.7)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? ColorManager.secondaryGrey,
                      width: widget.borderWidth ?? 0.5,
                    ),
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(15.w),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? ColorManager.secondaryGrey,
                      width: widget.borderWidth ?? 0.5,
                    ),
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(15.w),
                  ),
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                  prefixIcon: widget.prefixIcon,
                  icon: widget.icon,
                  suffixIcon: widget.isPasswordFiled
                      ? eyeIcon(obscureValue)
                      : widget.suffixIcon,
                  suffix: widget.suffix,
                  hintText: widget.hintText,
                  hintStyle: widget.hintTextStyle ??
                      context.textTheme.bodyMedium
                          ?.withColor(ColorManager.mainGrey),
                  labelText: widget.labelText,
                  labelStyle: widget.labelTextStyle ??
                      context.textTheme.bodySmall?.withColor(ColorManager.grey),
                ),
              );
            }),
      ],
    );
  }

  Widget eyeIcon(bool obscure) {
    return IconButton(
      onPressed: () => obscureNotifier.value = !obscure,
      icon: Icon(obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          color: ColorManager.primary),
    );
  }
}
