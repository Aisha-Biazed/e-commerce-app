import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:e_commerce_app/features/store/prdoucts/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import '../../../common/constants/cash_helper.dart';
import '../cubit/cubit.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  final DilocodeFoucs = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 17, end: 17, top: 15),
        child: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            return BlocListener<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is CreateSuccessState) {
                  context.goNamed(GRouter.config.productRoutes.productScreen);
                }
              },
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const RSizedBox(
                        height: 100,
                      ),
                      RSizedBox(
                          height: 190,
                          width: MediaQuery.of(context).size.width,
                          child: SvgPicture.asset(
                            allowDrawingOutsideViewBox: true,
                            ImageAssets.register,
                            fit: BoxFit.fitHeight,
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
                        validator: (val) {
                          if (val!.isEmpty) {
                            DilocodeFoucs.requestFocus();
                            return AppStrings.validateEmail;
                          }
                        },
                      ),
                      20.verticalSpace,
                      CustomTextFormField(
                        controller: emailController,
                        labelText: AppStrings.enterYourEmailLabel,
                        icon: LineIcons.at,
                        readOnly: false,
                        maxLines: 1,
                        validator: (val) {
                          if ((val!.isEmpty) &&
                              !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                            return AppStrings.validateEmail;
                          }
                        },
                      ),
                      20.verticalSpace,
                      CustomTextFormField(
                        controller: passwordController,
                        labelText: AppStrings.enterYourPasswordLabel,
                        isPasswordFiled: true,
                        readOnly: false,
                        icon: LineIcons.alternateUnlock,
                        maxLines: 1,
                        validator: (val) {
                          if (val!.isEmpty) {
                            DilocodeFoucs.requestFocus();
                            return AppStrings.validateEmail;
                          }
                        },
                      ),
                      20.verticalSpace,
                      ConditionalBuilder(
                        fallback: (BuildContext context) => Center(
                          child: SpinKitFadingCircle(
                            color: ColorManager.primary,
                          ),
                        ),
                        condition: state is! CreateLoadingState,
                        builder: (BuildContext context) => ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(AuthCubit.get(context).password);
                              print(AuthCubit.get(context).email);
                              AuthCubit.get(context).createUser(
                                userName: userNameController.text.toString(),
                                password: passwordController.text.toString(),
                                email: emailController.text.toString(),
                              );
                            }
                          },
                          child: const CustomText(txt: AppStrings.register),
                        )
                            .animate()
                            .flipV(delay: const Duration(milliseconds: 700)),
                      ),
                      10.verticalSpace,
                      ElevatedButton(
                          onPressed: () {
                            context.goNamed(
                                GRouter.config.authRoutes.profileScreen);
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorManager.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: ColorManager.primary),
                              ),
                            ),
                          ),
                          child: CustomText(
                            txt: AppStrings.profile,
                            txtColor: ColorManager.primary,
                            fontWeight: FontWeight.w300,
                          )),
                      20.verticalSpace
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
