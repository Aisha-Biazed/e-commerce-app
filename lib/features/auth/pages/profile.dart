import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:e_commerce_app/features/products/presentaion/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/routing/router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../cubit/cubit.dart';
import '../widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthCubit.get(context).profileCubit();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text('Profile Page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const RSizedBox(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            BlocBuilder<AuthCubit, AuthStates>(builder: (context, state) {
              if (state is ProfileSuccessState) {
                final item = state.result;
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 10, color: Colors.white),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5)),
                                ],
                              ),
                              child: Image.asset(
                                ImageAssets.profile,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ).animate().scaleXY(
                                  delay: const Duration(milliseconds: 100))),
                          20.verticalSpace,
                        ],
                      ),
                    ),
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
                                  .divideTiles(color: Colors.grey, tiles: [
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  leading: Icon(LineIcons.user,
                                      color: ColorManager.primary),
                                  title: const CustomText(
                                      txt: AppStrings.userName),
                                  subtitle: CustomText(
                                    txt: item.username!,
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  leading: Icon(LineIcons.github,
                                      color: ColorManager.primary),
                                  title:
                                      const CustomText(txt: AppStrings.email),
                                  subtitle: CustomText(
                                    txt: item.email!,
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
                                  title: const CustomText(
                                      txt: AppStrings.password),
                                  subtitle: CustomText(txt: item.password!),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 20,
                                  ),
                                  leading: Icon(
                                    LineIcons.phone,
                                    color: ColorManager.primary,
                                  ),
                                  title:
                                      const CustomText(txt: AppStrings.phone),
                                  subtitle: CustomText(txt: item.phone!),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 40, 25, 0),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: CustomText(
                          txt: AppStrings.logOut,
                          txtColor: ColorManager.white,
                        ),
                        onPressed: () async {
                          await (await SharedPreferences.getInstance()).clear();
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ProductsScreen()),
                              (Route<dynamic> route) => false);
                          context.goNamed(GRouter.config.authRoutes.login);
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: SpinKitFadingCircle(
                    color: ColorManager.primary,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
