// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flyfood_restaurant/core/api/exceptions.dart';
// import 'package:flyfood_restaurant/core/utils/extensions/build_context.dart';
// import 'package:flyfood_restaurant/core/utils/extensions/state_ext.dart';
// import 'package:flyfood_restaurant/features/app/presentation/widgets/app_svg_picture.dart';
// import 'package:flyfood_restaurant/generated/locale_keys.g.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flyfood_restaurant/generated/assets.dart';
//
// import '../core/config/routing/router.dart';
// import 'app/domin/repositories/prefs_repository.dart';
// import 'app/presentation/widgets/app_text.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     if (GetIt.I<PrefsRepository>().registeredUser) {
//       GoHome();
//     } else {
//       goLogin();
//     }
//     super.initState();
//   }
//
//   Future<void> goLogin() async {
//     await Future.delayed(
//       const Duration(seconds: 5),
//       () => context.pushReplacementNamed(GRouter.config.authRoutes.login),
//     );
//   }
//
//   Future<void> GoHome() async {
//     await Future.delayed(
//       const Duration(seconds: 3),
//       () => context.goNamed(GRouter.config.homeRoutes.homeScreen),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.colorScheme.primary,
//       body: Padding(
//         padding: REdgeInsetsDirectional.only(bottom: 24),
//         child: Center(
//           child: Column(
//             children: [
//               Spacer(),
//               Image.asset(Assets.splashImage, alignment: Alignment.center),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppText(
//                     AppStrings.MadeWithLoveInAmman,
//                     style: context.textTheme.titleMedium!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: context.colorScheme.onPrimary),
//                   ),
//                   5.horizontalSpace,
//                   const AppSvgPicture(Assets.HeartIcon),
//                 ],
//               ),
//               10.verticalSpace,
//               AppText(
//                 AppStrings.version,
//                 style: context.textTheme.titleSmall!
//                     .copyWith(color: context.colorScheme.onPrimary),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/core/utils/color_manger.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../common/constants/cash_helper.dart';
import '../core/config/routing/router.dart';
import '../core/utils/assets_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    if (CachHelper.sharedPreferences.getString('token') != null) {
      goProductsPage();
    } else {
      goLoginPage();
    }
    super.initState();
  }

  Future<void> goLoginPage() async {
    await Future.delayed(
      const Duration(seconds: 8),
      () => context.pushReplacementNamed(GRouter.config.authRoutes.login),
    );
  }

  Future<void> goProductsPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(GRouter.config.productRoutes.productScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Container(
          height: 600,
          color: ColorManager.white,
          child: Padding(
            padding: REdgeInsetsDirectional.only(top: 100, start: 20, end: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  allowDrawingOutsideViewBox: true,
                  ImageAssets.splash,
                  width: 299,
                  height: 299,
                  fit: BoxFit.cover,
                ).animate(onComplete: (c) => c.repeat()).shimmer(
                    delay: const Duration(milliseconds: 4000),
                    duration: const Duration(milliseconds: 2500)),
                10.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      txt: 'Welc',
                      fontSize: 20,
                    ),
                    CustomText(
                      txt: 'O',
                      fontSize: 20,
                      txtColor: ColorManager.primary,
                    ),
                    const CustomText(
                      txt: 'me',
                      fontSize: 20,
                    ),
                    5.horizontalSpace,
                    const CustomText(
                      txt: 't',
                      fontSize: 20,
                    ),
                    CustomText(
                      txt: 'O',
                      fontSize: 20,
                      txtColor: ColorManager.primary,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      txt: AppStrings.e,
                      txtColor: ColorManager.dark,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomText(
                      txt: AppStrings.commerce,
                      txtColor: ColorManager.primary,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ).animate(onComplete: (c) => c.repeat()).shimmer(
                    delay: const Duration(milliseconds: 3500),
                    duration: const Duration(milliseconds: 2400)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
