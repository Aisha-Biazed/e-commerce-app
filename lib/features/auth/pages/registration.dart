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
import 'package:form_builder_validators/form_builder_validators.dart';
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
  // final _formKey = GlobalKey<FormState>();
  // TextEditingController userNameController = TextEditingController(text: "");
  // TextEditingController passwordController = TextEditingController(text: "");
  // TextEditingController emailController = TextEditingController(text: "");
  // final DilocodeFoucs = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
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
                child: FormBuilder(
                  key: _formkey,
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
                        // controller: userNameController,
                        keyboardType: TextInputType.name,
                        labelText: AppStrings.enterUserNameLabel,
                        labelTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: ColorManager.secondaryGrey),
                        prefixIcon: Icon(
                          LineIcons.userCheck,
                          color: ColorManager.primary,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        name: 'username',
                      ),
                      20.verticalSpace,
                      CustomTextFormField(
                        // controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppStrings.enterYourEmailLabel,
                        labelTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: ColorManager.secondaryGrey),
                        prefixIcon: Icon(
                          LineIcons.at,
                          color: ColorManager.primary,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email()
                        ]),
                        name: 'email',
                        // validator: (val) {
                        //   if ((val!.isEmpty) &&
                        //       !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        //           .hasMatch(val)) {
                        //     return AppStrings.validateEmail;
                        //   }
                        // },
                      ),
                      20.verticalSpace,
                      CustomTextFormField(
                        // controller: passwordController,
                        labelText: AppStrings.enterYourPasswordLabel,
                        isPasswordFiled: true,
                        labelTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: ColorManager.secondaryGrey),
                        prefixIcon: Icon(
                          LineIcons.alternateUnlock,
                          color: ColorManager.primary,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6)
                        ]),
                        name: 'password',
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
                            _formkey.currentState!.save();
                            _formkey.currentState!.validate();
                            if (_formkey.currentState!.isValid) {
                              AuthCubit.get(context).createUser(
                                userName:
                                    _formkey.currentState!.value['username'],
                                email: _formkey.currentState!.value['email'],
                                password:
                                    _formkey.currentState!.value['password'],
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
