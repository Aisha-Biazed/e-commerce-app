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
