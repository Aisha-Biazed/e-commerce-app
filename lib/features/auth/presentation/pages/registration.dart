import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manger.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 17, end: 17, top: 15),
        child: Center(
          child: FormBuilder(
            key: _formkey,
            child: ListView(
              children: [
                const RSizedBox(
                  height: 100,
                ),
                RSizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      allowDrawingOutsideViewBox: true,
                      ImageAssets.register,
                      width: 40,
                      height: 40,
                    )),
                33.verticalSpace,
                const CustomText(
                  txt: AppStrings.register,
                  textAlign: TextAlign.start,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
                30.verticalSpace,
                const CustomTextFormField(
                  labelText: AppStrings.enterUserNameLabel,
                  maxLines: 1,
                  readOnly: false,
                  icon: LineIcons.userCheck,
                ),
                20.verticalSpace,
                const CustomTextFormField(
                  labelText: AppStrings.enterYourEmailLabel,
                  icon: LineIcons.at,
                  readOnly: false,
                  maxLines: 1,
                ),
                20.verticalSpace,
                CustomTextFormField(
                  // controller: passwordController,
                  labelText: AppStrings.enterYourPasswordLabel,
                  isPasswordFiled: true, readOnly: false,
                  suffexIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorManager.primary,
                  ),
                  icon: LineIcons.alternateUnlock,
                  maxLines: 1,
                ),
                60.verticalSpace,
                FadeInLeft(
                  delay: const Duration(milliseconds: 3200),
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed(GRouter.config.authRoutes.registration);
                    },
                    child: const CustomText(txt: AppStrings.register),
                  ),
                ),
                // FadeInDown(
                //   child: Center(
                //     child: TextButton(
                //       onPressed: () {
                //         context.goNamed(GRouter.config.authRoutes.registration);
                //       },
                //       style: ElevatedButton.styleFrom(
                //         foregroundColor: ColorManager.primary,
                //       ),
                //       child: const CustomText(
                //         txt: AppStrings.register,
                //       ),
                //     ),
                //   ),
                // ),
                // AppElevatedButton(
                //   text: AppStrings.register,
                //   onPressed: () {
                //     _formkey.currentState!.save();
                //     _formkey.currentState!.validate();
                //     if (_formkey.currentState!.isValid) {
                //       context.read<AuthBloc>().add(RegistrationEvent(
                //           email: _formkey.currentState!.value['email'],
                //           username: _formkey.currentState!.value['username'],
                //           password: _formkey.currentState!.value['password']));
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
