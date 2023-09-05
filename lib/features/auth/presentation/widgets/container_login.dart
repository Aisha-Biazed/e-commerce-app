import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/color_manger.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ContainerLogin extends StatefulWidget {
  ContainerLogin({Key? key}) : super(key: key);

  @override
  State<ContainerLogin> createState() => _ContainerLoginState();
}

class _ContainerLoginState extends State<ContainerLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 1.45,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            padding: REdgeInsetsDirectional.only(
              top: 15,
              start: 17,
              end: 17,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      child: const CustomText(
                        txt: AppStrings.login,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    30.verticalSpace,
                    FadeInDown(
                      delay: const Duration(milliseconds: 2300),
                      child: CustomTextFormField(
                        controller: emailController,
                        labelText: AppStrings.enterYourEmailLabel,
                        icon: LineIcons.at,
                        maxLines: 1,
                        readOnly: false,
                      ),
                    ),
                    30.verticalSpace,
                    FadeInDown(
                      delay: const Duration(milliseconds: 2900),
                      child: CustomTextFormField(
                        controller: passwordController,
                        isPasswordFiled: true,
                        labelText: AppStrings.enterYourPassLabel,
                        suffexIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: ColorManager.primary,
                        ),
                        readOnly: false,
                        icon: LineIcons.alternateUnlock,
                        // te: TextAlignVertical.center,
                      ),
                    ),
                    30.verticalSpace,
                    // BlocSelector<AuthBloc, AuthState, BlocStatus>(
                    //   selector: (state) => state.loginStatus,
                    //   builder: (context, state) {
                    //     return FadeInLeft(
                    //       delay: const Duration(milliseconds: 3200),
                    //       child: AppElevatedButton(
                    //         text: AppStrings.login,
                    //         isLoading: state.isLoading(),
                    //         onPressed: () {
                    //           _formkey.currentState!.save();
                    //           _formkey.currentState!.validate();
                    //           context.read<AuthBloc>().add(LoginEvent(
                    //               email: _formkey.currentState!.value['email'],
                    //               password: _formkey
                    //                   .currentState!.value['password']));
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 3200),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const CustomText(txt: AppStrings.login),
                      ),
                    ),
                    20.verticalSpace,
                    FadeInDown(
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            context.goNamed(
                                GRouter.config.authRoutes.registration);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: ColorManager.primary,
                          ),
                          child: const CustomText(
                            txt: AppStrings.register,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
