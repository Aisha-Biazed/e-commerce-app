import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/utils/color_manger.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/auth/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:e_commerce_app/features/products/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // AuthCubit.get(context).profileCubit();
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        return Expanded(
          child: BlocListener<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                // context.goNamed(
                //     GRouter.config.authRoutes.registration);
              }
            },
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
                              controller: userNameController,
                              labelText: AppStrings.enterUserNameLabel,
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
                          FadeInLeft(
                            delay: const Duration(milliseconds: 3200),
                            child: ConditionalBuilder(
                              fallback: (BuildContext context) => Center(
                                child: SpinKitFadingCircle(
                                  color: ColorManager.primary,
                                ),
                              ),
                              condition: state is! LoginLoadingState,
                              builder: (BuildContext context) => ElevatedButton(
                                onPressed: () {
                                  // if (_formkey.currentState!.validate()) {
                                  print(userNameController.text);
                                  print(passwordController.text);
                                  AuthCubit.get(context).login(
                                    userName:
                                        userNameController.text.toString(),
                                    password:
                                        passwordController.text.toString(),
                                  );
                                },
                                // },
                                child: const CustomText(txt: AppStrings.login),
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          FadeInDown(
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  // AuthCubit.get(context).profileCubit();
                                  //
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
          ),
        );
      },
    );
  }
}
