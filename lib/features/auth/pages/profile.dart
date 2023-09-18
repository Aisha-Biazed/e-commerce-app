import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:e_commerce_app/features/auth/pages/login.dart';
import 'package:e_commerce_app/features/store/prdoucts/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../core/config/routing/router.dart';
import '../cubit/cubit.dart';
import '../widgets/custom_image_profile.dart';
import '../widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    AuthCubit.get(context).profileCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                ColorManager.primary,
                ColorManager.primary,
                // Theme.of(context).primaryColor , Theme.of(context).accentColor
              ])),
        ),
      ),
      //   يوجد بعض المشاكل في رابط الـ Api
      // عندما نقوم بإنشاء حساب لايعيد id صحيحة وقيمتها null
      // لذا من الصعب أن تجلبidUser ونعرضها في البروفايل
      //اقمت بتمرير المتحولات التي أنشأنها بها الحساب
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const RSizedBox(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            BlocBuilder<AuthCubit, AuthStates>(builder: (context, state) {
              // if (state is ProfileSuccessState) {
              //   final item = state.result;
              return Column(
                children: [
                  const CustomImageProfile(),
                  Padding(
                    padding: REdgeInsetsDirectional.only(
                      start: 30,
                      end: 30,
                    ),
                    child: Card(
                      child: Container(
                        alignment: Alignment.topRight,
                        padding:
                            REdgeInsetsDirectional.only(start: 20, end: 20),
                        child: Column(
                          children: <Widget>[
                            ...ListTile
                                .divideTiles(color: ColorManager.grey, tiles: [
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                leading: Icon(LineIcons.user,
                                    color: ColorManager.primary),
                                title:
                                    const CustomText(txt: AppStrings.userName),
                                subtitle: CustomText(
                                  // txt: item.username!,
                                  txt: AuthCubit.get(context)
                                      .userName
                                      .toString(),
                                ),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                leading: Icon(LineIcons.github,
                                    color: ColorManager.primary),
                                title: const CustomText(txt: AppStrings.email),
                                subtitle: CustomText(
                                  txt: AuthCubit.get(context).email.toString(),
                                ),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 20,
                                ),
                                leading: Icon(
                                  LineIcons.lock,
                                  color: ColorManager.primary,
                                ),
                                title:
                                    const CustomText(txt: AppStrings.password),
                                subtitle: CustomText(
                                    txt: AuthCubit.get(context)
                                        .password
                                        .toString()),
                              ),
                              // ListTile(
                              //   contentPadding:
                              //       const EdgeInsets.symmetric(
                              //     horizontal: 12,
                              //     vertical: 20,
                              //   ),
                              //   leading: Icon(
                              //     LineIcons.phone,
                              //     color: ColorManager.primary,
                              //   ),
                              //   title: const CustomText(
                              //       txt: AppStrings.phone),
                              //   subtitle: CustomText(txt: item.phone!),
                              // ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsetsDirectional.only(
                      top: 120,
                      start: 30,
                      end: 30,
                    ),
                    child: ElevatedButton(
                        onPressed: () async {
                          await (await SharedPreferences.getInstance()).clear();
                          // ignore: use_build_context_synchronously
                          GoRouter.of(context).pop((route) => route.isFirst);
                          // ignore: use_build_context_synchronously
                          GoRouter.of(context)
                              .go(GRouter.config.authRoutes.login);
                        },
                        child: const CustomText(
                          txt: AppStrings.logout,
                        )),
                  )
                ],
              );
              // } else {
              //   return Center(
              //     child: SpinKitFadingCircle(
              //       color: ColorManager.primary,
              //     ),
              //   );
              // }
            }),
          ],
        ),
      ),
    );
  }
}
