import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manger.dart';
import '../../cubit/cubit.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 17, end: 17, top: 15),
        child: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            return Center(
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
                    CustomTextFormField(
                      controller: userNameController,
                      labelText: AppStrings.enterUserNameLabel,
                      maxLines: 1,
                      readOnly: false,
                      icon: LineIcons.userCheck,
                    ),
                    20.verticalSpace,
                    CustomTextFormField(
                      controller: emailController,
                      labelText: AppStrings.enterYourEmailLabel,
                      icon: LineIcons.at,
                      readOnly: false,
                      maxLines: 1,
                    ),
                    20.verticalSpace,
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: AppStrings.enterYourPasswordLabel,
                      isPasswordFiled: true,
                      readOnly: false,
                      suffexIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: ColorManager.primary,
                      ),
                      icon: LineIcons.alternateUnlock,
                      maxLines: 1,
                    ),
                    20.verticalSpace,
                    FadeInLeft(
                      delay: const Duration(milliseconds: 3200),
                      child: ConditionalBuilder(
                        fallback: (BuildContext context) => Center(
                          child: SpinKitFadingCircle(
                            color: ColorManager.primary,
                          ),
                        ),
                        condition: state is! CreateLoadingState,
                        builder: (BuildContext context) => ElevatedButton(
                          onPressed: () {
                            // if (_formkey.currentState!.validate()) {
                            AuthCubit.get(context).createUser(
                              userName: userNameController.text.toString(),
                              password: passwordController.text.toString(),
                              email: emailController.text.toString(),
                            );
                            context.goNamed(GRouter.config.profileRoutes.profileScreen);
                          },
                          // },
                          child: const CustomText(txt: AppStrings.register),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
